<template>
  <section>
    <!-- TEKS PEMBUKA -->
    <div class="intro-text">
      <p>
        Jogja Inside mengajakmu menyelami sisi lain Yogyakarta yang penuh kejutan. 
        Di balik hiruk-pikuk kota budaya, tersimpan destinasi tersembunyi yang menanti untuk ditemukan. 
        Dari gang kecil hingga lembah sunyi, setiap sudut Jogja menyimpan cerita yang memperkaya jiwa. 
        Kami hadir untuk menghubungkanmu dengan pengalaman otentik, membawamu lebih dekat dengan keindahan yang belum banyak dijelajahi.
      </p>
    </div>

  </section>
</template>

<script>
export default {
  name: "TopDestinasi",
}
</script>

<style scoped>
/* TEKS PEMBUKA */
.intro-text {
  max-width: 900px;
  margin: 60px auto 40px auto;
  padding: 0 20px;
  font-family: sans-serif;
  font-size: 16px;
  line-height: 1.8;
  color: #333;
  text-align: justify;
}

/*=============================================================== MOBILE ==================================================================== */
@media (max-width: 768px) {
  /* Nonaktifkan animasi fadeInRight dan fadeInLeft di mobile */

  .intro-text {
    order: 1;
    padding: 0 15px;
    font-size: 14px;
    text-align: justify;
  }
}
</style>
