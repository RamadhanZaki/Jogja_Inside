<template>
  <section class="all-region">
    <div class="container">
      <div class="title-aligner">
        <h2 class="section-title">Explor Destinasi</h2>
      </div>
      <div class="region-layout">
        <div class="row">
          <router-link
            v-for="(region, index) in regions.slice(0, 2)"
            :key="index"
            :to="{ name: 'DestinationResult', query: { region: region.name } }"
            class="region-card"
            :style="{ backgroundImage: `url(${region.image})` }"
          >
            <div class="overlay">
              <h3 class="region-title">{{ region.name }}</h3>
            </div>
          </router-link>
        </div>

        <div class="row">
          <router-link
            v-for="(region, index) in regions.slice(2, 4)"
            :key="index + 2"
            :to="{ name: 'DestinationResult', query: { region: region.name } }"
            class="region-card"
            :style="{ backgroundImage: `url(${region.image})` }"
          >
            <div class="overlay">
              <h3 class="region-title">{{ region.name }}</h3>
            </div>
          </router-link>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "AllRegion",
  data() {
    return {
      regions: [
        { name: "Bantul", image: require("@/assets/Home/Bantul.jpg") },
        { name: "Sleman", image: require("@/assets/Home/Sleman.jpg") },
        { name: "Kulon Progo", image: require("@/assets/Home/KulonProgo.jpg") },
        { name: "GunungKidul", image: require("@/assets/Home/Gunungkidul.jpg") },
      ],
    };
  },
};
</script>

<style scoped>
.all-region {
  padding: 40px 0;
}

.container {
  padding: 0 20px;
}

.title-aligner {
  display: flex;
  justify-content: flex-start;
  margin-left: calc((100% - 500px * 2 - 30px) / 2); /* sejajarkan kiri kartu */
}

.section-title {
  font-size: 22px;
  font-weight: 600;
  margin-bottom: 30px;
  text-align: left;
}

.region-layout {
  display: flex;
  flex-direction: column;
  gap: 30px;
}

.row {
  display: flex;
  justify-content: center;
  gap: 30px;
}

.region-card {
  width: 100%;
  max-width: 500px;
  height: 280px;
  background-size: cover;
  background-position: center;
  overflow: hidden;
  position: relative;
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  text-decoration: none;
  color: inherit;
  transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth animation */
  border-radius: 12px; /* Opsional: sudut sedikit melengkung */
}

/* 🔥 Efek saat hover */
.region-card:hover {
  transform: scale(1.03);
  box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3); /* Bayangan lebih dalam */
  z-index: 2; /* Supaya card di atas elemen sekitarnya */
}


.overlay {
  background-color: rgba(0, 0, 0, 0.45);
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.region-title {
  color: white;
  font-weight: bold;
  font-size: 26px;
  text-align: center;
  text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.6);
}

@media screen and (max-width: 768px) {
  .container {
    padding: 0 30px;
  }

  .row {
    flex-wrap: wrap;
    column-gap: 8px;
    row-gap: 6px; /* ✅ Semakin rapat vertikal */
    justify-content: space-between;
  }

  .region-card {
    width: calc(50% - 4px);
    height: 125px;
  }

  .region-title {
    font-size: 13px;
    margin: 0; /* ✅ Hapus margin default yg mungkin menambah jarak */
  }

  .overlay {
    padding: 0;        /* pastikan tidak menambah jarak internal */
  }

  .title-aligner {
    margin-left: 0;
    justify-content: center;
  }

  .section-title {
    text-align: center;
    font-size: 18px;
    margin-bottom: 16px;
  }

  .all-region {
    padding: 18px 0;
  }
}

</style>
