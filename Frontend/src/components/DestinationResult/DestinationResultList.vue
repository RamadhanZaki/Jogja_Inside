<template>
  <div class="destination-list">
    <h2 class="search-result-title">
      <template v-if="searchQuery">
        Hasil pencarian yang cocok dengan "{{ searchQuery }}"
      </template>
      <template v-else>
        {{ dynamicTitle }}
      </template>
    </h2>

    <div
      v-for="(item, index) in destinations"
      :key="index"
      class="destination-card"
      @click="goToDetail(item.slug)"
      style="cursor: pointer"
    >
      <img
        :src="item.thumbnail_url"
        alt="destinasi"
        class="card-image"
        @error="item.thumbnail_url = fallbackImage"
        loading="lazy"
      />
      <div class="card-info">
        <span v-if="item.label" class="label-tag">
          {{ labelIcon(item.label) }} {{ item.label }}
        </span>
        <span class="category-label">{{ item.category }}</span>
        <h3 class="title">{{ item.name }}</h3>
        <div class="rating">
          <span class="rating-number">{{ parseFloat(item.rating).toFixed(1) }}</span>
          <span class="rating-dots">
            <span
              class="dot"
              v-for="n in 5"
              :key="n"
              :class="{ active: n <= Math.floor(item.rating) }"
            ></span>
          </span>
        </div>
        <p class="location">{{ item.region }}, Yogyakarta, Indonesia</p>
      </div>
    </div>

    <div class="load-more-container">
      <button v-if="!allDataLoaded" @click="loadMore" class="load-more-button">
        Load More
      </button>
      <p v-else class="end-message">Semua destinasi sudah ditampilkan.</p>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import debounce from "lodash/debounce";

export default {
  name: "DestinationResultList",
  props: {
    searchQuery: String,
    filters: Object
  },
  data() {
    return {
      destinations: [],
      fallbackImage: "https://via.placeholder.com/300x200?text=No+Image",
      limit: 5,
      offset: 0,
      total: 0,
      allDataLoaded: false,
      debouncedFetch: () => {}
    };
  },
  computed: {
    dynamicTitle() {
      if (this.filters.all) return "Semua Destinasi Wisata";

      const region = this.filters.region[0] || "";
      const label = this.filters.label[0] || "";
      const category = this.filters.category[0] || "";

      if (region && !label && !category) return `Semua Destinasi Wisata di ${region}`;
      if (label && !region && !category) return `Semua ${label} di Yogyakarta`;
      if (category && !region && !label) return `Semua Wisata ${category} di Yogyakarta`;

      let parts = [];
      if (category) parts.push(`Wisata ${category}`);
      if (label) parts.push(label);
      if (region) parts.push(`di ${region}`);

      return `Semua ${parts.join(" ")}`;
    }
  },
  watch: {
    filters: {
      handler() {
        this.resetAndFetch();
      },
      deep: true,
      immediate: true
    },
    searchQuery: {
      handler() {
        this.resetAndFetch();
      },
      immediate: true
    }
  },
  created() {
    this.debouncedFetch = debounce(this.fetchFilteredDestinations, 300);
  },
  methods: {
    async fetchFilteredDestinations() {
      try {
        const params = {
          limit: this.limit,
          offset: this.offset
        };

        if (this.searchQuery) {
          params.search = this.searchQuery;
        }

        if (!this.filters.all) {
          if (this.filters.region.length) {
            params.region = this.filters.region.join(",");
          }
          if (this.filters.label.length) {
            params.label = this.filters.label.join(",");
          }
          if (this.filters.category.length) {
            params.category = this.filters.category.join(",");
          }
        }

        const response = await axios.get(
          `${process.env.VUE_APP_API_BASE}/destinations`,
          { params }
        );

        const newData = response.data.data;
        const totalCount = response.data.total;

        this.total = totalCount;
        this.destinations.push(...newData);
        this.offset += this.limit;

        if (this.destinations.length >= this.total) {
          this.allDataLoaded = true;
        }
      } catch (error) {
        console.error("Gagal memuat destinasi:", error);
      }
    },
    resetAndFetch() {
      this.offset = 0;
      this.allDataLoaded = false;
      this.destinations = [];

      if (typeof this.debouncedFetch === "function") {
        this.debouncedFetch();
      } else {
        this.fetchFilteredDestinations();
      }
    },
    loadMore() {
      this.fetchFilteredDestinations();
    },
    labelIcon(label) {
      const icons = {
        "Hidden Gem": "💎",
        "Nature": "🌿",
        "Popular": "🔥",
        "Family": "👨‍👩‍👧‍👦"
      };
      return icons[label] || "🏷️";
    },
    goToDetail(slug) {
      this.$router.push(`/destination/${slug}`);
    }
  }
};
</script>

<style scoped>
.destination-list {
  display: flex;
  flex-direction: column;
  gap: 24px;
}
.search-result-title {
  font-size: 20px;
  font-weight: 600;
  color: #222;
  margin-bottom: 8px;
}
.destination-card {
  display: flex;
  background-color: #fff;
  border-radius: 10px;
  overflow: hidden;
  border: 1px solid #ddd;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
  transition: box-shadow 0.2s ease;
  padding: 16px;
  align-items: flex-start;
}
.destination-card:hover {
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.12);
}
.card-image {
  width: 300px;
  height: 200px;
  object-fit: cover;
  border-radius: 8px;
  flex-shrink: 0;
}
.card-info {
  padding-left: 24px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 8px;
  flex: 1;
}
.label-tag,
.category-label {
  font-size: 13px;
  font-weight: 600;
  background-color: #f0f0f0;
  padding: 4px 10px;
  border-radius: 4px;
  width: fit-content;
  margin-bottom: 4px;
  color: #000;
}
.title {
  margin: 0;
  font-size: 22px;
  font-weight: 700;
  color: #111;
}
.rating {
  font-size: 15px;
  color: #444;
  display: flex;
  align-items: center;
  gap: 8px;
}
.rating-number {
  font-weight: bold;
  color: #00aa6c;
  font-size: 16px;
}
.rating-dots {
  display: flex;
  gap: 3px;
}
.rating-dots .dot {
  width: 10px;
  height: 10px;
  background-color: #ccc;
  border-radius: 50%;
}
.rating-dots .dot.active {
  background-color: #00aa6c;
}
.location {
  font-size: 15px;
  color: #777;
  margin-top: 2px;
}
.load-more-container {
  margin-top: 24px;
}
.load-more-button {
  background-color: #333;
  color: white;
  border: none;
  padding: 10px 20px;
  font-weight: bold;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.2s ease;
}
.load-more-button:hover {
  background-color: #000000;
}
.end-message {
  color: #888;
  font-style: italic;
  font-size: 20px;
}

@media (max-width: 768px) {
  .destination-card {
    padding: 12px;
    gap: 12px;
  }

  .card-image {
    width: 45vw; /* proporsional terhadap layar */
    height: auto;
    max-height: 160px;
  }

  .card-info {
    padding-left: 12px;
    gap: 4px;
  }

  .title {
    font-size: 16px;
  }

  .label-tag,
  .category-label {
    font-size: 11px;
    padding: 3px 8px;
  }

  .rating {
    font-size: 13px;
  }

  .rating-number {
    font-size: 14px;
  }

  .rating-dots .dot {
    width: 8px;
    height: 8px;
  }

  .location {
    font-size: 13px;
  }

  .load-more-button {
    padding: 10px 16px;
    font-size: 14px;
  }

  .end-message {
    font-size: 14px;
  }
}

</style>
