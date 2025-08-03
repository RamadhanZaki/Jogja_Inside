<template>
  <section class="trusted-section">
    <div class="trusted-container">
      <div class="logo-text-wrapper">
        <!-- Logo statis -->
        <img src="@/assets/Home/Jogja-Inside.png" alt="Logo" class="logo-static" />

        <!-- Running text -->
        <div class="text-marquee-wrapper">
          <div class="text-marquee-content">
            <span class="marquee-text">www.jogja-inside.my.id</span>
            <span class="marquee-text">www.jogja-inside.my.id</span>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "TrustedByLogos",
};
</script>

<style scoped>
.trusted-section {
  background-color: #ffffff;
  padding: 15px 0;
  overflow: hidden;
}

.trusted-container {
  max-width: 1060px;
  margin: 0 auto;
  padding: 0;
  box-sizing: border-box;
}

.logo-text-wrapper {
  display: flex;
  align-items: center;
  gap: 20px;
  overflow: hidden;
}

.logo-static {
  height: 150px;
  width: auto;
  object-fit: contain;
  flex-shrink: 0;
}

.text-marquee-wrapper {
  flex: 1;
  overflow: hidden;
  position: relative;
  height: 60px;
}

/* ⬇️ Gradasi fade kiri-kanan */
.text-marquee-wrapper::before,
.text-marquee-wrapper::after {
  content: "";
  position: absolute;
  top: 0;
  width: 60px;
  height: 100%;
  z-index: 2;
  pointer-events: none;
}

.text-marquee-wrapper::before {
  left: 0;
  background: linear-gradient(to right, #fff 0%, transparent 100%);
}

.text-marquee-wrapper::after {
  right: 0;
  background: linear-gradient(to left, #fff 0%, transparent 100%);
}

.text-marquee-content {
  display: inline-block;
  white-space: nowrap;
  animation: scroll-marquee 14s linear infinite;
  position: relative;
  z-index: 1;
}

.marquee-text {
  font-size: 40px;
  font-weight: 500;
  opacity: 0.7;
  color: #000000;
  margin-right: 500px; /* Atur jarak antar teks */
}

@keyframes scroll-marquee {
  0% {
    transform: translateX(0%);
  }
  100% {
    transform: translateX(-50%);
  }
}

@media (max-width: 768px) {
  .logo-static {
    height: 72px;
  }

  .marquee-text {
    font-size: 16px;
  }

  .trusted-container {
    padding: 0 20px;
  }

  .text-marquee-wrapper::before,
  .text-marquee-wrapper::after {
    width: 30px;
  }
}
</style>
