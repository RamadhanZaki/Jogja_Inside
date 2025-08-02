<template>
  <div class="page-list">
    <div v-if="currentView === 'list'">
    <div class="toolbar-wrapper">
      <div class="toolbar">
        <button class="btn btn-success" @click="openAddView">+ New</button>
        <button class="btn btn-primary">{{ selected.length }} items selected</button>
        <button class="btn btn-danger" @click="handleDelete" v-if="selected.length"><i class="fas fa-trash"></i> DELETE</button>
        
        <input class="input-sm form-control" type="text" v-model="searchQuery" placeholder="Search by username" />
        
        <select class="select-sm form-control" v-model="roleFilter">
          <option value="">All Roles</option>
          <option value="Admin">Admin</option>
          <option value="Super Admin">Super Admin</option>
        </select>
        
        <button class="btn btn-secondary btn-sm" @click="exportCSV">Export CSV</button>
      </div>
    </div>
      <div class="table-wrapper">
        <table class="styled-table">
          <thead>
            <tr>
              <th><input type="checkbox" v-model="selectAll" @change="toggleSelectAll" /></th>
              <th>No</th> <!-- Diubah dari ID menjadi No -->
              <th>Username</th>
              <th>Email</th>
              <th>Role</th>
              <th>Created at</th>
              <th>Updated at</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(page, i) in paginatedData"
              :key="page.id"
              :class="{ selected: selected.includes(pageIndex(i)) }"
            >
              <td><input type="checkbox" v-model="selected" :value="pageIndex(i)" /></td>
              <td>{{ pageIndex(i) + 1 }}</td> <!-- Nomor urut -->
              <td>{{ page.username }}</td>
              <td><a href="#">{{ page.email }}</a></td>
              <td>
                <span class="badge" :class="page.role === 'Super Admin' ? 'badge-code' : 'badge-special'">
                  {{ page.role }}
                </span>
              </td>
              <td>{{ formatDate(page.createdAt) }}</td>
              <td>{{ formatDate(page.updatedAt) }}</td>
              <td>
                <i class="fas fa-edit action-icon" @click="openEditView(page)"></i>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="pagination">
        <button @click="prevPage" :disabled="page === 1">Previous</button>
        <span>Page {{ page }} of {{ totalPages }}</span>
        <button @click="nextPage" :disabled="page === totalPages">Next</button>
      </div>
    </div>

    <AddUser
      v-if="currentView === 'add'"
      @close="currentView = 'list'"
      @created="handleUserCreated"
    />

    <EditUser
      v-if="currentView === 'edit'"
      :user="userToEdit"
      @close="currentView = 'list'"
      @update="handleUserUpdate"
    />

    <!-- Modal Konfirmasi Delete -->
    <div v-if="showDeleteConfirm" class="modal-overlay">
      <div class="modal-content">
        <h3>Konfirmasi Penghapusan</h3>
        <p>Anda yakin ingin menghapus data berikut?</p>
        <ul>
          <li v-for="username in usernamesToDelete" :key="username">{{ username }}</li>
        </ul>
        <div class="modal-actions">
          <button class="btn btn-danger" @click="confirmDelete">Yes</button>
          <button class="btn btn-secondary" @click="cancelDelete">Cancel</button>
        </div>
      </div>
    </div>

    <!-- Toast Notification -->
    <div class="toast" v-if="showToast">{{ toastMessage }}</div>
  </div>
</template>

<script>
import axios from 'axios';
import AddUser from './AddUser.vue';
import EditUser from './EditUser.vue';

export default {
  components: { EditUser, AddUser },
  data() {
    return {
      selectAll: false,
      selected: [],
      searchQuery: '',
      roleFilter: '',
      page: 1,
      perPage: 10,
      pages: [],
      currentView: 'list',
      userToEdit: null,

      showDeleteConfirm: false,
      usernamesToDelete: [],

      showToast: false,
      toastMessage: '',
    };
  },
  computed: {
    filteredPages() {
      return this.pages.filter(page => {
        const matchesSearch = page.username.toLowerCase().includes(this.searchQuery.toLowerCase()) ||
          page.email.toLowerCase().includes(this.searchQuery.toLowerCase());
        const matchesRole = this.roleFilter ? page.role === this.roleFilter : true;
        return matchesSearch && matchesRole;
      });
    },
    totalPages() {
      return Math.ceil(this.filteredPages.length / this.perPage);
    },
    paginatedData() {
      const start = (this.page - 1) * this.perPage;
      return this.filteredPages.slice(start, start + this.perPage);
    }
  },
  mounted() {
    this.fetchUsers();
  },
  methods: {
    fetchUsers() {
      const apiBase = process.env.VUE_APP_API_BASE || 'https://jogja-inside.my.id/api';
      axios.get(`${apiBase}/users`)
        .then(response => {
          this.pages = response.data.map(user => ({
            ...user,
            createdAt: user.created_at,
            updatedAt: user.updated_at,
          })).sort((a, b) => a.id - b.id);
        })
        .catch(error => {
          console.error('Gagal mengambil data user:', error);
        });
    },
    toggleSelectAll() {
      if (this.selectAll) {
        this.selected = this.paginatedData.map((_, i) => this.pageIndex(i));
      } else {
        this.selected = [];
      }
    },
    pageIndex(i) {
      return (this.page - 1) * this.perPage + i;
    },
    prevPage() {
      if (this.page > 1) this.page--;
    },
    nextPage() {
      if (this.page < this.totalPages) this.page++;
    },

    handleDelete() {
      const idsToDelete = this.selected.map(i => this.filteredPages[i]?.id).filter(id => id != null);
      if (!idsToDelete.length) {
        alert("Pilih data yang ingin dihapus.");
        return;
      }
      this.usernamesToDelete = this.selected.map(i => this.filteredPages[i]?.username).filter(u => u != null);
      this.showDeleteConfirm = true;
    },

    confirmDelete() {
      const apiBase = process.env.VUE_APP_API_BASE || 'https://jogja-inside.my.id/api';
      const idsToDelete = this.selected.map(i => this.filteredPages[i]?.id).filter(id => id != null);
      axios.delete(`${apiBase}/users`, {
        data: { ids: idsToDelete }
      })
      .then(() => {
        this.pages = this.pages.filter(user => !idsToDelete.includes(user.id));
        this.selected = [];
        this.selectAll = false;
        this.showDeleteConfirm = false;
        this.showSuccessToast('Data berhasil dihapus.');
      })
      .catch(error => {
        console.error('Gagal menghapus data:', error);
        alert('Gagal menghapus data.');
        this.showDeleteConfirm = false;
      });
    },


    cancelDelete() {
      this.showDeleteConfirm = false;
    },

    exportCSV() {
      const rows = [
        ['No', 'Username', 'Email', 'Role', 'Created At', 'Updated At'],
        ...this.filteredPages.map((p, i) => [
          i + 1, p.username, p.email, p.role, this.formatDate(p.createdAt), this.formatDate(p.updatedAt)
        ])
      ];
      const csv = rows.map(r => r.map(val => `"${val}"`).join(',')).join('\n');
      const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
      const link = document.createElement('a');
      link.href = URL.createObjectURL(blob);
      link.setAttribute('download', 'exported_data.csv');
      link.click();
    },
    openAddView() {
      this.currentView = 'add';
    },
    openEditView(user) {
      this.userToEdit = { ...user };
      this.currentView = 'edit';
    },
    handleUserUpdate(updatedUser) {
      const index = this.pages.findIndex(p => p.id === updatedUser.id);
      if (index !== -1) {
        this.pages.splice(index, 1, {
          ...updatedUser,
          createdAt: updatedUser.created_at,
          updatedAt: updatedUser.updated_at,
        });
        this.showSuccessToast('User berhasil diperbarui.');
      } else {
        this.showErrorToast('User tidak ditemukan untuk diperbarui.');
      }
      this.currentView = 'list';
    },

    async handleUserCreated() {
      try {
        await this.fetchUsers();
        this.showSuccessToast('User berhasil ditambahkan.');
      } catch (error) {
        this.showErrorToast('Gagal memuat ulang data setelah penambahan.');
      }
      this.currentView = 'list';
    },

    formatDate(datetime) {
      const date = new Date(datetime);
      return date.toLocaleDateString('id-ID', {
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      });
    },

    showSuccessToast(message) {
      this.toastMessage = message;
      this.showToast = true;
      this.setToastColor('#28a745');
      setTimeout(() => {
        this.showToast = false;
      }, 3000);
    },

    showErrorToast(message) {
      this.toastMessage = message;
      this.showToast = true;
      this.setToastColor('#dc3545');
      setTimeout(() => {
        this.showToast = false;
      }, 3000);
    },

    setToastColor(color) {
      this.$nextTick(() => {
        const toastEl = document.querySelector('.toast');
        if (toastEl) toastEl.style.backgroundColor = color;
      });
    },
  }
};
</script>


<style scoped>
.page-list {
  padding: 20px;
  font-family: 'Segoe UI', sans-serif;
  background-color: #f5f5f5; /* abu-abu terang */
  min-height: 100vh; /* agar latar tidak terpotong meskipun konten pendek */
}

.toolbar-wrapper {
  margin-bottom: 10px;
}

.toolbar {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: flex-start;
  gap: 10px;
  margin-bottom: 10px;
}


.input-sm,
.select-sm {
  padding: 6px 12px;
  font-size: 14px;
  height: 38px;
  line-height: 1.42857143;
  color: #555;
  background-color: #fff;
  background-image: none;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
  transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}


.input-sm {
  width: 200px;
}

.select-sm {
  width: 160px;
}

.btn-sm {
  padding: 6px 12px;
  font-size: 14px;
  line-height: 1.42857143;
  border-radius: 4px;
}


.toolbar {
  display: flex;
  gap: 10px;
  margin-bottom: 10px;
  flex-wrap: wrap;
}


.btn {
  padding: 5px 10px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 14px;
}

.btn-success {
  background-color: #28a745;
  color: #fff;
}

.btn-primary {
  background-color: #007bff;
  color: #fff;
}

.btn-danger {
  background-color: #dc3545;
  color: #fff;
}

.btn-secondary {
  background-color: #28a745;
  color: #fff;
}

.table-wrapper {
  max-width: 100%;
  /* max-height: 600px; --> hapus atau komentar */
  overflow-x: auto; /* hanya scroll horizontal jika tabel lebar */
  border: 1px solid #ccc;
  border-radius: 4px;
}


.styled-table {
  width: max-content;
  border-collapse: collapse;
  min-width: 100%;
}

.styled-table th,
.styled-table td {
  border: 1px solid #dee2e6;
  padding: 8px;
  text-align: center;
  white-space: nowrap;
}

.styled-table th {
  background-color: #f1f1f1;
}

.selected {
  background-color: #fff9c4;
}

.badge {
  padding: 3px 6px;
  border-radius: 4px;
  margin: 0 2px;
  color: #fff;
  font-size: 12px;
  text-transform: lowercase;
}

.badge-special {
  background-color: #28a745;
}

.badge-code {
  background-color: #007bff;
}

.action-icon {
  margin: 0 5px;
  cursor: pointer;
  color: #444;
}

.pagination {
  margin-top: 10px;
  display: flex;
  align-items: center;
  gap: 10px;
}

/* Modal styles */
.modal-overlay {
  position: fixed;
  top: 0; left: 0; right: 0; bottom: 0;
  background: rgba(0,0,0,0.4);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
}

.modal-content {
  background: white;
  padding: 20px 30px;
  border-radius: 8px;
  max-width: 400px;
  text-align: center;
  box-shadow: 0 4px 12px rgba(0,0,0,0.25);
}

.modal-actions {
  margin-top: 20px;
  display: flex;
  justify-content: center;
  gap: 15px;
}

/* Toast Notification */
.toast {
  position: fixed;
  top: 20px;
  right: 20px;
  background-color: #333; /* Default warna, akan diubah lewat JS */
  color: white;
  padding: 12px 20px;
  border-radius: 5px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.15);
  font-weight: 600;
  z-index: 10000;
  animation: fadeInOut 3s forwards;
}


@keyframes fadeInOut {
  0% { opacity: 0; transform: translateY(-20px); }
  10%, 90% { opacity: 1; transform: translateY(0); }
  100% { opacity: 0; transform: translateY(-20px); }
}
</style>
