<template>
  <section id="footer">
    <footer class="footer" role="contentinfo">
      <!-- Social Media -->
      <div class="social-media-section">
        <div class="connect-and-icons">
          <p class="connect-text">FOLLOW US</p>
          <div class="social-icons">
            <a href="https://instagram.com/akunmu" target="_blank" rel="noopener" aria-label="Instagram Jogja Inside">
              <i class="fab fa-instagram" aria-hidden="true"></i>
            </a>
            <a href="https://twitter.com/akunmu" target="_blank" rel="noopener" aria-label="Twitter Jogja Inside">
              <i class="fab fa-x-twitter" aria-hidden="true"></i>
            </a>
            <a href="https://facebook.com/akunmu" target="_blank" rel="noopener" aria-label="Facebook Jogja Inside">
              <i class="fab fa-facebook" aria-hidden="true"></i>
            </a>
            <a href="https://tiktok.com/@akunmu" target="_blank" rel="noopener" aria-label="TikTok Jogja Inside">
              <i class="fab fa-tiktok" aria-hidden="true"></i>
            </a>
            <a href="https://pinterest.com/akunmu" target="_blank" rel="noopener" aria-label="Pinterest Jogja Inside">
              <i class="fab fa-pinterest" aria-hidden="true"></i>
            </a>
            <a href="https://youtube.com/akunmu" target="_blank" rel="noopener" aria-label="YouTube Jogja Inside">
              <i class="fab fa-youtube" aria-hidden="true"></i>
            </a>
          </div>
        </div>
      </div>

      <!-- Footer Dark -->
      <div class="footer-dark">
        <h2 class="visually-hidden">Jogja Inside Footer</h2>
        <div class="text-center logo-footer">
          <img
            src="@/assets/thumbnail/Icon/Jogja_Inside.webp"
            alt="Logo Jogja Inside - Panduan Wisata dan Kuliner Yogyakarta"
            width="100"
            height="50"
            loading="lazy"
          />
        </div>
        <div class="text-center copyright">
          © 2025 Jogja Inside. All Rights Reserved.
        </div>
        <div class="text-center copyright-note">
          “Jogja Inside - Merangkul Pesona Jogja, Satu Cerita di Setiap Sudut.”<br />
          Menyajikan ragam wisata, kuliner, sejarah, dan keindahan alam Yogyakarta untuk menemani setiap perjalananmu.
        </div>
      </div>
    </footer>
  </section>
</template>

<script>
export default {
  name: 'AppFooter',
};
</script>

<style scoped>
.footer {
  background-color: #f2f2f2;
  padding-bottom: 0;
  margin: 0;
}

.social-media-section {
  display: flex;
  justify-content: center;
}

.connect-and-icons {
  display: flex;
  align-items: center;
  gap: 15px;
  flex-wrap: wrap;
}

.connect-text {
  font-weight: bold;
  letter-spacing: 1px;
  font-size: 14px;
  color: #333;
  margin: 0;
  white-space: nowrap;
}

.social-icons a {
  display: inline-block;
  margin: 0 8px;
  font-size: 28px;
  color: #333;
  transition: color 0.3s;
}

.social-icons a:hover {
  color: #ff3c38;
}

.footer-dark {
  background-color: #2e2e2e;
  color: #ccc;
  padding: 10px 10px;
}

.logo-footer img {
  max-height: 40px;
  margin: 10px auto;
  display: block;
}

.text-center {
  text-align: center;
}

.copyright {
  font-size: 13px;
  color: #ccc;
  margin-top: 5px;
}

.copyright-note {
  font-size: 11px;
  color: #ccc;
  max-width: 600px;
  margin: 10px auto 0;
  line-height: 1.5;
  padding: 0 10px;
}

/* Visually hidden heading for accessibility */
.visually-hidden {
  position: absolute;
  width: 1px;
  height: 1px;
  margin: -1px;
  padding: 0;
  overflow: hidden;
  clip: rect(0 0 0 0);
  white-space: nowrap;
  border: 0;
}

/* Responsive */
@media (max-width: 768px) {
  .connect-and-icons {
    justify-content: center;
    gap: 10px;
  }

  .social-icons a {
    font-size: 24px;
    margin: 0 4px;
  }

  .connect-text {
    font-size: 13px;
  }

  .logo-footer img {
    max-height: 30px;
  }

  .copyright-note {
    font-size: 10px;
  }
}
</style>
