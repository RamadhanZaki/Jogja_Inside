<template>
  <aside class="sidebar">
    <h3 class="sidebar-title">Filter</h3>

    <!-- ✅ Checkbox All Destinasi -->
    <div class="filter-section">
      <label>
        <input type="checkbox" v-model="allSelected" @change="handleAllToggle" />
        Semua Destinasi
      </label>
    </div>

    <!-- Region Filter -->
    <div class="filter-section">
      <h4 class="filter-title">Region</h4>
      <div v-for="region in regions" :key="region">
        <label>
          <input
            type="checkbox"
            :value="region"
            v-model="selected.region"
            @change="handleFilterChange"
          />
          {{ region }}
        </label>
      </div>
    </div>

    <!-- Label Filter -->
    <div class="filter-section">
      <h4 class="filter-title">Label</h4>
      <div v-for="(label, key) in labels" :key="key">
        <label>
          <input
            type="checkbox"
            :value="label"
            v-model="selected.label"
            @change="handleFilterChange"
          />
          {{ label }}
        </label>
      </div>
    </div>

    <!-- Category Filter -->
    <div class="filter-section">
      <h4 class="filter-title">Category</h4>
      <div v-for="category in categories" :key="category">
        <label>
          <input
            type="checkbox"
            :value="category"
            v-model="selected.category"
            @change="handleFilterChange"
          />
          {{ category }}
        </label>
      </div>
    </div>

    <!-- 🔄 Tombol Reset Filter -->
    <div class="filter-section">
      <button class="reset-button" @click="resetFilters">Reset Filter</button>
    </div>
  </aside>
</template>

<script>
export default {
  name: "SideBarDestinationResult",
  props: {
    searchQuery: String
  },
  data() {
    return {
      allSelected: true, // ✅ Default aktif
      selected: {
        region: [],
        label: [],
        category: [],
      },
      regions: ["Yogyakarta", "Bantul", "Sleman", "Kulon Progo", "GunungKidul"],
      labels: {
        "🔥 Trending Now": "Trending Now",
        "🌿 Hidden Gem": "Hidden Gem",
        "📸 Aesthetic Place": "Aesthetic Place",
        "🧭 Nature Escape": "Nature Escape"
      },
      categories: [
        "Pantai",
        "Situs Sejarah",
        "Tempat Rekreasi",
        "Gunung & Trekking",
        "Wisata Kuliner",
        "Wisata Air",
        "Wisata Religi",
        "Alam Terbuka"
      ]
    };
  },
  watch: {
    selected: {
      handler(val) {
        this.checkAllSelected();
        this.$emit('filter-changed', { ...val, all: this.allSelected });
      },
      deep: true
    },
    searchQuery(newVal) {
      if (newVal && newVal.trim() !== "") {
        this.allSelected = false;
        this.$emit('filter-changed', { ...this.selected, all: false });
      }
    }
  },
  mounted() {
    const regionQuery = this.$route.query.region;
    const searchQuery = this.$route.query.search;

    // Jika ada query region
    if (regionQuery && this.regions.includes(regionQuery)) {
      this.selected.region = [regionQuery];
      this.allSelected = false;
      this.$emit('filter-changed', { ...this.selected, all: false });
    }

    // Jika ada pencarian
    if (searchQuery && searchQuery.trim() !== "") {
      this.allSelected = false;
      this.$emit('filter-changed', { ...this.selected, all: false });
    }

    // Jika tidak ada filter dan pencarian, semua tercentang
    if (!regionQuery && !searchQuery) {
      this.allSelected = true;
      this.$emit('filter-changed', { ...this.selected, all: true });
    }
  },
  methods: {
    handleAllToggle() {
      if (this.allSelected) {
        this.selected.region = [];
        this.selected.label = [];
        this.selected.category = [];
      }
      this.$emit('filter-changed', { ...this.selected, all: this.allSelected });
    },
    handleFilterChange() {
      this.checkAllSelected();
    },
    checkAllSelected() {
      const hasAnyFilter =
        this.selected.region.length > 0 ||
        this.selected.label.length > 0 ||
        this.selected.category.length > 0;

      this.allSelected = !hasAnyFilter;
    },
    resetFilters() {
      this.selected.region = [];
      this.selected.label = [];
      this.selected.category = [];
      this.allSelected = true;
      this.$emit('filter-changed', { ...this.selected, all: true });
    }
  }
};
</script>

<style scoped>
.sidebar {
  background-color: #fff;
  padding: 1.5rem;
  border-radius: 10px;
  border: 1px solid #ddd;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.06);
  width: 280px;
}

.sidebar-title {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 1rem;
}

.filter-section {
  margin-bottom: 1.5rem;
}

.filter-title {
  font-size: 17px;
  font-weight: 600;
  margin-bottom: 0.5rem;
}

label {
  display: block;
  font-size: 15px;
  margin-bottom: 6px;
}

.reset-button {
  background-color: #e53e3e;
  color: #fff;
  border: none;
  padding: 8px 14px;
  font-size: 14px;
  font-weight: 600;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.2s ease;
  width: 100%;
}
.reset-button:hover {
  background-color: #c53030;
}

@media (max-width: 768px) {
  .sidebar {
    padding: 1rem;
    border: 1px solid #ddd;
    border-radius: 12px;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
    background-color: #fff;
    animation: fadeIn 0.2s ease-in-out;
  }

  .sidebar-title {
    font-size: 18px;
    text-align: center;
    margin-bottom: 1rem;
  }

  .filter-section {
    margin-bottom: 1.2rem;
  }

  .filter-title {
    font-size: 15px;
    font-weight: 600;
    margin-bottom: 0.5rem;
  }

  label {
    font-size: 14px;
    margin-bottom: 4px;
  }

  .reset-button {
    font-size: 14px;
    padding: 10px;
  }

  @keyframes fadeIn {
    0% {
      opacity: 0;
      transform: translateY(-8px);
    }
    100% {
      opacity: 1;
      transform: translateY(0);
    }
  }
}

</style>
