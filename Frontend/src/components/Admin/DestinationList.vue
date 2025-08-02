<template>
  <div class="page-list">
    <!-- View List -->
    <div v-if="currentView === 'list'">
      <div class="toolbar-wrapper">
        <div class="toolbar">
          <button class="btn btn-success" @click="openAddView">+ New</button>
          <button class="btn btn-primary">{{ selected.length }} items selected</button>
          <button class="btn btn-danger" @click="handleDelete" v-if="selected.length">
            <i class="fas fa-trash"></i> DELETE
          </button>
          <input class="filter-input" type="text" v-model="searchQuery" placeholder="Search destination..." />
          <select class="filter-select" v-model="regionFilter">
            <option value="">All Regions</option>
            <option v-for="region in regionOptions" :key="region" :value="region">{{ region }}</option>
          </select>
          <select class="filter-select" v-model="categoryFilter">
            <option value="">All Categories</option>
            <option v-for="cat in categoryOptions" :key="cat" :value="cat">{{ cat }}</option>
          </select>
          <button class="btn btn-secondary" @click="exportCSV">Export CSV</button>
        </div>
      </div>

      <div class="table-wrapper">
        <table class="styled-table">
          <thead>
            <tr>
              <th><input type="checkbox" v-model="selectAll" @change="toggleSelectAll" /></th>
              <th>No</th>
              <th>Destination</th>
              <th>Region</th>
              <th>Category</th>
              <th>Rating</th>
              <th>Created At</th>
              <th>Updated At</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(dest, i) in paginatedData"
              :key="dest.id"
              :class="{ selected: selected.includes(pageIndex(i)) }"
            >
              <td><input type="checkbox" v-model="selected" :value="dest.id" /></td>
              <td>{{ pageIndex(i) + 1 }}</td>
              <td>{{ dest.name }}</td>
              <td>{{ dest.region || 'N/A' }}</td>
              <td>{{ dest.category }}</td>
              <td>{{ dest.rating }}</td>
              <td>{{ formatDate(dest.created_at) }}</td>
              <td>{{ formatDate(dest.updated_at) }}</td>
              <td>
                <i class="fas fa-edit action-icon" @click="openEditView(dest)"></i>
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

    <!-- View Add -->
    <div v-else-if="currentView === 'add'">
      <AddDestination
        v-if="true"
        @close="currentView = 'list'"
        @created="handleDestinationAdded"
      />
    </div>

    <!-- View Edit -->
    <div v-else-if="currentView === 'edit' && currentEdit">
      <EditDestination
        :destinationData="currentEdit"
        @updated="handleUpdatedDestination"
        @close="currentView = 'list'"
      />
    </div>

    <!-- Toast Notification -->
    <div class="toast" v-if="showToast">{{ toastMessage }}</div>
  </div>
</template>

<script>
import axios from 'axios';
import AddDestination from './AddDestination.vue';
import EditDestination from './EditDestination.vue';

const apiBase = process.env.VUE_APP_API_BASE;

export default {
  components: { AddDestination, EditDestination },
  data() {
    return {
      destinations: [],
      regionOptions: [],
      categoryOptions: [],
      searchQuery: '',
      regionFilter: '',
      categoryFilter: '',
      selected: [],
      selectAll: false,
      page: 1,
      perPage: 10,
      currentView: 'list',
      currentEdit: null,
      showToast: false,
      toastMessage: ''
    };
  },
  mounted() {
    this.fetchDestinations();
  },
  methods: {
    fetchDestinations() {
      axios.get(`${apiBase}/destinations`)
        .then(response => {
          this.destinations = response.data.data || response.data; // tergantung struktur API
          this.extractFilterOptions();
        })
        .catch(error => {
          console.error('Gagal memuat data:', error);
        });
    },
    extractFilterOptions() {
      const regions = new Set();
      const categories = new Set();
      this.destinations.forEach(d => {
        if (d.region) regions.add(d.region);
        if (d.category) categories.add(d.category);
      });
      this.regionOptions = [...regions];
      this.categoryOptions = [...categories];
    },
    pageIndex(i) {
      return (this.page - 1) * this.perPage + i;
    },
    toggleSelectAll() {
      if (this.selectAll) {
        this.selected = this.paginatedData.map(dest => dest.id);
      } else {
        this.selected = [];
      }
    },

    prevPage() {
      if (this.page > 1) this.page--;
    },
    nextPage() {
      if (this.page < this.totalPages) this.page++;
    },
    exportCSV() {
      const rows = [
        ['No', 'Destination', 'Region', 'Category', 'Rating', 'Created At', 'Updated At'],
        ...this.filteredDestinations.map((d, i) => [
          i + 1, d.name, d.region || '', d.category, d.rating,
          this.formatDate(d.created_at), this.formatDate(d.updated_at)
        ])
      ];
      const csv = rows.map(r => r.map(val => `"${val}"`).join(',')).join('\n');
      const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
      const link = document.createElement('a');
      link.href = URL.createObjectURL(blob);
      link.setAttribute('download', 'destinations.csv');
      link.click();
    },
    openAddView() {
      this.currentView = 'add';
    },
    openEditView(dest) {
      this.currentEdit = { ...dest };
      this.currentView = 'edit';
    },
    handleDestinationAdded() {
      this.currentView = 'list';           // ✅ Kembali ke daftar
      this.fetchDestinations();            // 🔄 Ambil ulang data
      this.showSuccessToast('✅ Destinasi berhasil ditambahkan!');
    },
    handleDelete() {
      if (!this.selected.length) return;

      axios.delete(`${apiBase}/destinations`, {
        data: { ids: this.selected }
      })

      .then(() => {
        this.fetchDestinations(); // Re-fetch data dari database
        this.selected = [];
        this.selectAll = false;
        this.showSuccessToast('Data berhasil dihapus dari database.');
      })
      .catch((err) => {
        console.error('❌ Gagal menghapus:', err);
        this.showSuccessToast('Gagal menghapus data.');
      });
    },


    formatDate(date) {
      const d = new Date(date);
      return d.toLocaleDateString('id-ID', {
        year: 'numeric', month: 'long', day: 'numeric'
      });
    },
    showSuccessToast(msg) {
      this.toastMessage = msg;
      this.showToast = true;
      setTimeout(() => {
        this.showToast = false;
      }, 3000);
    }
  },
  computed: {
    filteredDestinations() {
      return this.destinations.filter(dest => {
        const matchesSearch = dest.name?.toLowerCase().includes(this.searchQuery.toLowerCase()) || false;
        const matchesRegion = this.regionFilter ? dest.region === this.regionFilter : true;
        const matchesCategory = this.categoryFilter ? dest.category === this.categoryFilter : true;
        return matchesSearch && matchesRegion && matchesCategory;
      });
    },
    totalPages() {
      return Math.ceil(this.filteredDestinations.length / this.perPage);
    },
    paginatedData() {
      const start = (this.page - 1) * this.perPage;
      return this.filteredDestinations.slice(start, start + this.perPage);
    }
  }
};
</script>



<style scoped>
@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css');

/* === Wrapper Utama === */
.page-list {
  padding: 20px;
  font-family: 'Segoe UI', sans-serif;
  background-color: #f5f5f5;
  min-height: 100vh;
  font-size: 13px;
}

/* === Toolbar === */
.toolbar-wrapper {
  margin-bottom: 15px;
}
.toolbar {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 10px;
  margin-bottom: 10px;
}

/* === Tombol === */
.btn {
  padding: 5px 10px;
  font-size: 13px;
  height: 34px;
  line-height: 1.5;
  border-radius: 4px;
  border: none;
  cursor: pointer;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  font-weight: 500;
  box-sizing: border-box;
}
.btn-success   { background-color: #28a745; color: #fff; }
.btn-primary   { background-color: #007bff; color: #fff; }
.btn-danger    { background-color: #dc3545; color: #fff; }
.btn-secondary { background-color: #6c757d; color: #fff; }

/* === Input dan Select === */
.filter-input,
.filter-select {
  padding: 5px 10px;
  font-size: 13px;
  height: 34px;
  line-height: 1.5;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
.filter-input { width: 200px; }
.filter-select { width: 160px; }

/* === Tabel === */

.table-wrapper {
  max-width: 100%;
  max-height: 600px; /* Perpanjang ukuran vertikal tabel */
  overflow: auto;
  border: 1px solid #ccc;
  border-radius: 4px;
}


.styled-table {
  width: 100%;
  border-collapse: collapse;
}
.styled-table th,
.styled-table td {
  border: 1px solid #dee2e6;
  padding: 8px;
  text-align: center;
  white-space: nowrap;
  font-size: 13px;
}
.styled-table th {
  background-color: #f1f1f1;
}
.selected {
  background-color: #fff9c4;
}

/* === Aksi Ikon === */
.action-icon {
  margin: 0 5px;
  cursor: pointer;
  color: #444;
  font-size: 13px;
}

/* === Pagination === */
.pagination {
  margin-top: 10px;
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 13px;
}

/* === Toast === */
.toast {
  position: fixed;
  top: 20px;
  right: 20px;
  background-color: #28a745;
  color: white;
  padding: 10px 16px;
  border-radius: 5px;
  font-weight: 600;
  z-index: 10000;
  font-size: 13px;
  animation: fadeInOut 3s forwards;
}
@keyframes fadeInOut {
  0%   { opacity: 0; transform: translateY(-20px); }
  10%, 90% { opacity: 1; transform: translateY(0); }
  100% { opacity: 0; transform: translateY(-20px); }
}
</style>
