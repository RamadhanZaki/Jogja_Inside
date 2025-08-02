<template>
  <div class="destination-results-page">
    <Navbar />
    <DestinationResultHeader
      :searchQuery="searchQuery"
      @search-updated="onSearchUpdated"
    />

    <!-- 🔘 Tombol toggle sidebar (mobile only) -->
    <div class="filter-toggle-wrapper" v-if="isMobile">
      <button class="toggle-filter-button" @click="showSidebar = !showSidebar">
        {{ showSidebar ? 'Sembunyikan Filter' : 'Tampilkan Filter' }}
      </button>
    </div>

    <div class="layout-container">
      <!-- ✅ Sidebar: tampil selalu di desktop, toggle di mobile -->
      <aside
        class="sidebar-area"
        v-show="!isMobile || showSidebar"
        :class="{ 'dropdown-sidebar': isMobile }"
      >
        <SideBarDestinationResult
          :searchQuery="searchQuery"
          @filter-changed="updateFilter"
        />
      </aside>

      <div class="main-area">
        <DestinationResultList
          :filters="activeFilter"
          :searchQuery="searchQuery"
        />
      </div>
    </div>

    <Footer />
  </div>
</template>

<script>
import SideBarDestinationResult from '@/components/DestinationResult/SideBarDestinationResult.vue';
import DestinationResultHeader from '@/components/DestinationResult/DestinationResultHeader.vue';
import DestinationResultList from '@/components/DestinationResult/DestinationResultList.vue';
import Navbar from '@/components/Navbar.vue';
import Footer from '@/components/Footer.vue';

export default {
  name: "DestinationResultsPage",
  components: {
    Navbar,
    SideBarDestinationResult,
    DestinationResultHeader,
    DestinationResultList,
    Footer,
  },
  data() {
    return {
      activeFilter: {
        all: true,
        region: [],
        label: [],
        category: []
      },
      searchQuery: "",
      showSidebar: false,
      isMobile: false
    };
  },
  mounted() {
    this.checkScreenSize();
    window.addEventListener("resize", this.checkScreenSize);

    const query = this.$route.query;

    if (query.all === 'true') {
      this.activeFilter = {
        all: true,
        region: [],
        label: [],
        category: []
      };
      this.searchQuery = "";
      return;
    }

    if (query.region) {
      this.activeFilter = {
        all: false,
        region: [query.region],
        label: [],
        category: []
      };
    }

    if (query.search) {
      this.searchQuery = query.search;
      this.activeFilter.all = false;
    }
  },
  beforeDestroy() {
    window.removeEventListener("resize", this.checkScreenSize);
  },
  methods: {
    updateFilter(val) {
      this.activeFilter = val;
    },
    onSearchUpdated(query) {
      this.searchQuery = query;
      this.activeFilter.all = false;
    },
    checkScreenSize() {
      this.isMobile = window.innerWidth <= 768;
      if (!this.isMobile) {
        this.showSidebar = false;
      }
    }
  }
};
</script>

<style scoped>
.destination-results-page {
  background-color: #f5f5f5;
}

.layout-container {
  display: flex;
  align-items: flex-start;
  gap: 2rem;
  padding: 2rem;
}

.sidebar-area {
  width: 300px;
}

.main-area {
  flex: 1;
}

/* 🔘 Tombol filter mobile */
.filter-toggle-wrapper {
  text-align: center;
  margin: 1rem 0;
}

.toggle-filter-button {
  background-color: #222;
  color: white;
  padding: 10px 16px;
  font-size: 15px;
  border: none;
  border-radius: 8px;
  cursor: pointer;
}

/* 📱 Mode mobile (sidebar dropdown) */
@media (max-width: 768px) {
  .layout-container {
    flex-direction: column;
    padding: 1rem;
  }

  .sidebar-area {
    width: 100%;
    padding: 1rem;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    animation: slideDown 0.3s ease-in-out;
  }

  @keyframes slideDown {
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
