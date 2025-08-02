<template>
  <div class="page-list">
    <div v-if="currentView === 'list'">
    <div class="toolbar">
      <button class="btn btn-success btn-sm" @click="openAddView">+ New</button>
      <button class="btn btn-primary btn-sm">{{ selected.length }} items selected</button>
      <button class="btn btn-danger btn-sm" @click="handleDelete" v-if="selected.length">
        <i class="fas fa-trash"></i> DELETE
      </button>

      <input
        type="text"
        v-model="searchQuery"
        placeholder="Search by name"
        class="input-sm form-control"
      />
      <button class="btn btn-secondary btn-sm" @click="exportCSV">Export CSV</button>
    </div>
      <div class="table-wrapper">
        <table class="styled-table">
          <thead>
            <tr>
              <th><input type="checkbox" :checked="allVisibleSelected" @change="toggleSelectAll" /></th>
              <th>No</th>
              <th>Name</th>
              <th>Job</th>
              <th>Instagram</th>
              <th>GitHub</th>
              <th>Created at</th>
              <th>Updated at</th>
              <th>Image</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(team, index) in paginatedData" :key="team.id" :class="{ selected: selected.includes(team.id) }">
              <td><input type="checkbox" :value="team.id" v-model="selected" /></td>
              <td>{{ (page - 1) * perPage + index + 1 }}</td>
              <td>{{ team.name }}</td>
              <td>{{ team.job }}</td>
              <td>
                <a v-if="team.instagram" :href="team.instagram" target="_blank" class="link-blue">Link</a>
                <span v-else>-</span>
              </td>
              <td>
                <a v-if="team.github" :href="team.github" target="_blank" class="link-blue">Link</a>
                <span v-else>-</span>
              </td>
              <td>{{ formatDate(team.createdAt) }}</td>
              <td>{{ formatDate(team.updatedAt) }}</td>
              <td>
                <img :src="getImageUrl(team.img)" alt="Team Image" class="thumb-img" />
              </td>
              <td>
                <i class="fas fa-edit action-icon" @click="openEditView(team)"></i>
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

    <AddTeam v-if="currentView === 'add'" @close="currentView = 'list'" @created="handleTeamCreated" />
    <EditTeam v-if="currentView === 'edit'" :team="teamToEdit" @close="currentView = 'list'" @update="handleTeamUpdate" />

    <div v-if="showDeleteConfirm" class="modal-overlay">
      <div class="modal-content">
        <h3>Konfirmasi Penghapusan</h3>
        <p>Anda yakin ingin menghapus data berikut?</p>
        <ul>
          <li v-for="name in namesToDelete" :key="name">{{ name }}</li>
        </ul>
        <div class="modal-actions">
          <button class="btn btn-danger" @click="confirmDelete">Yes</button>
          <button class="btn btn-secondary" @click="cancelDelete">Cancel</button>
        </div>
      </div>
    </div>

    <div class="toast" v-if="showToast">{{ toastMessage }}</div>
  </div>
</template>

<script>
import axios from 'axios';
import AddTeam from './AddTeam.vue';
import EditTeam from './EditTeam.vue';

const apiBase = process.env.VUE_APP_API_BASE || 'https://jogja-inside.my.id/api';

export default {
  components: { AddTeam, EditTeam },
  data() {
    return {
      teams: [],
      selected: [],
      searchQuery: '',
      page: 1,
      perPage: 5,
      currentView: 'list',
      teamToEdit: null,
      showDeleteConfirm: false,
      namesToDelete: [],
      showToast: false,
      toastMessage: '',
    };
  },
  computed: {
    filteredTeams() {
      return this.teams
        .filter(team => team.name.toLowerCase().includes(this.searchQuery.toLowerCase()))
        .sort((a, b) => a.id - b.id);
    },
    totalPages() {
      return Math.ceil(this.filteredTeams.length / this.perPage);
    },
    paginatedData() {
      const start = (this.page - 1) * this.perPage;
      return this.filteredTeams.slice(start, start + this.perPage);
    },
    allVisibleSelected() {
      return this.paginatedData.every(team => this.selected.includes(team.id));
    }
  },
  mounted() {
    this.fetchTeams();
  },
  methods: {
    getImageUrl(path) {
      if (!path) return '';
      if (path.startsWith('http')) return path;

      // Jika path dimulai dengan '/storage', gunakan domain langsung tanpa '/api'
      if (path.startsWith('/storage')) {
        return `https://jogja-inside.my.id${path}`;
      }

      // Default: gabungkan dengan base URL tanpa /api
      const baseWithoutApi = apiBase.replace(/\/api$/, '');
      return `${baseWithoutApi}${path}`;
    },

    fetchTeams() {
      axios.get(`${apiBase}/teams`)
        .then(response => {
          this.teams = response.data.map(t => ({
            ...t,
            createdAt: t.created_at,
            updatedAt: t.updated_at,
          }));
        })
        .catch(error => {
          console.error('Gagal mengambil data tim:', error);
        });
    },
    toggleSelectAll(event) {
      const isChecked = event.target.checked;
      const visibleIds = this.paginatedData.map(t => t.id);
      if (isChecked) {
        this.selected = Array.from(new Set([...this.selected, ...visibleIds]));
      } else {
        this.selected = this.selected.filter(id => !visibleIds.includes(id));
      }
    },
    prevPage() {
      if (this.page > 1) this.page--;
    },
    nextPage() {
      if (this.page < this.totalPages) this.page++;
    },
    handleDelete() {
      const idsToDelete = this.selected;
      this.namesToDelete = this.teams.filter(t => idsToDelete.includes(t.id)).map(t => t.name);
      this.showDeleteConfirm = true;
    },
    confirmDelete() {
      axios.delete(`${apiBase}/teams`, { data: { ids: this.selected } })
        .then(() => {
          this.teams = this.teams.filter(t => !this.selected.includes(t.id));
          this.selected = [];
          this.showDeleteConfirm = false;
          this.showSuccessToast('Data berhasil dihapus.');
        })
        .catch(() => {
          this.showErrorToast('Gagal menghapus data.');
          this.showDeleteConfirm = false;
        });
    },
    cancelDelete() {
      this.showDeleteConfirm = false;
    },
    exportCSV() {
      const rows = [
        ['No', 'Name', 'Job', 'Instagram', 'GitHub', 'Image', 'Created At', 'Updated At'],
        ...this.filteredTeams.map((t, index) => [
          index + 1,
          t.name,
          t.job,
          t.instagram,
          t.github,
          t.img,
          this.formatDate(t.createdAt),
          this.formatDate(t.updatedAt)
        ])
      ];
      const csv = rows.map(r => r.map(val => `"${val}"`).join(',')).join('\n');
      const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
      const link = document.createElement('a');
      link.href = URL.createObjectURL(blob);
      link.setAttribute('download', 'teams_export.csv');
      link.click();
    },
    openAddView() {
      this.currentView = 'add';
    },
    openEditView(team) {
      this.teamToEdit = { ...team };
      this.currentView = 'edit';
    },
    async handleTeamUpdate() {
      try {
        await this.fetchTeams();
        this.showSuccessToast('Tim berhasil diperbarui.');
      } catch {
        this.showErrorToast('Gagal mengambil data terbaru.');
      }
      this.currentView = 'list';
    },
    async handleTeamCreated() {
      try {
        await this.fetchTeams();
        this.showSuccessToast('Tim berhasil ditambahkan.');
      } catch {
        this.showErrorToast('Gagal menambahkan tim.');
      }
      this.currentView = 'list';
    },
    formatDate(datetime) {
      return new Date(datetime).toLocaleDateString('id-ID', {
        year: 'numeric', month: 'long', day: 'numeric'
      });
    },
    showSuccessToast(message) {
      this.toastMessage = message;
      this.showToast = true;
      this.setToastColor('#28a745');
      setTimeout(() => (this.showToast = false), 3000);
    },
    showErrorToast(message) {
      this.toastMessage = message;
      this.showToast = true;
      this.setToastColor('#dc3545');
      setTimeout(() => (this.showToast = false), 3000);
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
  background-color: #f5f5f5; /* Tambahkan baris ini */
  min-height: 100vh; /* Opsional: agar background tidak terpotong meskipun konten sedikit */
}



.toolbar {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  margin-bottom: 15px;
  align-items: center;
}

.input-sm,
.select-sm {
  padding: 6px 12px;
  font-size: 14px;
  height: 38px;
  line-height: 1.42857143;
  color: #555;
  background-color: #fff;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
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
  box-sizing: border-box;
}



.toolbar, .filters {
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
.btn-success { background-color: #28a745; color: #fff; }
.btn-primary { background-color: #007bff; color: #fff; }
.btn-danger { background-color: #dc3545; color: #fff; }
.btn-secondary { background-color: #6c757d; color: #fff; }

.table-wrapper {
  min-height: 400px; /* Menambahkan tinggi minimum */
  max-height: 600px; /* Meningkatkan tinggi maksimum agar tabel lebih panjang */
  overflow: auto;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.styled-table {
  width: 100%;
  border-collapse: collapse;
}
.styled-table th, .styled-table td {
  border: 1px solid #dee2e6;
  padding: 8px;
  text-align: center;
}
.styled-table th {
  background-color: #f1f1f1;
}
.selected {
  background-color: #fff9c4;
}
.action-icon {
  margin: 0 5px;
  cursor: pointer;
  color: #444;
}
.pagination {
  margin-top: 10px;
  display: flex;
  gap: 10px;
  align-items: center;
}
.link-blue {
  color: #007bff;
  text-decoration: underline;
  cursor: pointer;
}
.thumb-img {
  width: 60px;
  height: 60px;
  object-fit: cover;
  border-radius: 6px;
  box-shadow: 0 0 3px rgba(0,0,0,0.3);
}
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
.toast {
  position: fixed;
  top: 20px;
  right: 20px;
  background-color: #333;
  color: white;
  padding: 12px 20px;
  border-radius: 5px;
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
