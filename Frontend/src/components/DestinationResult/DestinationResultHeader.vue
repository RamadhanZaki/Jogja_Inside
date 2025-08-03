<template>
  <div class="search-header-wrapper">
    <!-- ✅ Overlay -->
    <div class="overlay"></div>

    <!-- ✅ Konten -->
    <div class="search-header-inner">
      <!-- ✅ Teks Header -->
      <h1 class="search-heading">
        Cari destinasi impianmu di Yogyakarta dan sekitarnya!
      </h1>

      <!-- ✅ Search Box -->
      <div class="search-bar">
        <i class="fas fa-search search-icon"></i>
        <input
          type="text"
          class="search-input"
          v-model="localSearch"
          @input="emitSearch"
          @keyup.enter="emitSearch"
          placeholder="Cari Destinasimu disini..."
        />
        <button class="search-button" @click="emitSearch">
          <i class="fas fa-search"></i>
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "DestinationResultHeader",
  props: {
    searchQuery: {
      type: String,
      default: ""
    }
  },
  data() {
    return {
      localSearch: this.searchQuery
    };
  },
  watch: {
    searchQuery(newVal) {
      this.localSearch = newVal;
    }
  },
  methods: {
    emitSearch() {
      this.$emit("search-updated", this.localSearch);
    }
  }
};
</script>

<style scoped>
.search-header-wrapper {
  width: 100%;
  min-height: 320px;
  background-image: url('@/assets/Background/Home.jpg');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  box-sizing: border-box;
  position: relative;
  display: flex;
  align-items: flex-end;
  padding-bottom: 60px;
  overflow-x: hidden;
}

.overlay {
  position: absolute;
  inset: 0;
  background-color: rgba(0, 0, 0, 0.45);
  z-index: 1;
}

.search-header-inner {
  position: relative;
  z-index: 2;
  width: 100%;
  max-width: 1140px;
  margin-left: auto;
  margin-right: auto;
  padding-left: 10px;
  padding-right: 10px;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 16px;
}

.search-heading {
  color: white;
  font-size: 22px;
  font-weight: 600;
  margin: 0;
}

.search-bar {
  display: flex;
  align-items: center;
  border-radius: 6px;
  background-color: #fff;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
  overflow: hidden;
  max-width: 600px;
  width: 100%;
  padding-left: 14px;
  padding-right: 6px;
  height: 48px;
}

.search-icon {
  font-size: 16px;
  color: #666;
  margin-right: 10px;
}

.search-input {
  flex: 1;
  border: none;
  outline: none;
  font-size: 16px;
  padding: 10px 0;
  background: transparent;
  color: #333;
}

.search-button {
  background-color: white;
  border: none;
  padding: 0 14px;
  cursor: pointer;
  font-size: 18px;
  color: #444;
}

.search-button i {
  font-family: 'Font Awesome 5 Free';
  font-weight: 900;
}

@media (max-width: 768px) {
  .search-header-wrapper {
    padding-bottom: 50px;
    min-height: 260px;
  }

  .search-header-inner {
    padding-left: 12px;
    padding-right: 12px;
    gap: 14px;
  }

  .search-heading {
    font-size: 16px;
    text-align: left;
  }

  .search-bar {
    height: 42px;
    max-width: 100%;
  }

  .search-input {
    font-size: 14px;
  }

  .search-button {
    font-size: 16px;
    padding: 0 10px;
  }
}
</style>
