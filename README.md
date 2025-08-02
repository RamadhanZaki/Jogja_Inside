
README - PANDUAN INSTALASI XAMPP & SETUP PROJEK Laravel + Vue (JOGJA-INSIDE)

📝 Tujuan:
Menyamakan semua lingkungan kerja agar project Laravel & Vue dapat dijalankan 
dengan lancar tanpa error yang disebabkan oleh perbedaan versi PHP, XAMPP, 
Composer, dan Node.js.

Download: 
https://drive.google.com/drive/folders/15ZVC3EFA0V_qBJe4QBsRxljCt_uaTMhV?usp=drive_link

✅ STEP 1: UNINSTALL XAMPP LAMA (JIKA ADA)
1. Buka XAMPP Control Panel
2. Stop Apache & MySQL
3. Uninstall XAMPP dari Control Panel > Programs
4. Hapus folder "C:\xampp" secara manual jika masih ada

✅ STEP 2: INSTALL XAMPP BARU (Versi yang Disarankan)

🧩 XAMPP Version: 8.1.12 (PHP 8.1.12)

✅ STEP 3: INSTALL DEPENDENSI TAMBAHAN
1. Install Composer
   Setelah selesai, buka CMD dan ketik:
   composer -V → harus muncul versinya

2. Install Node.js (versi LTS)
   Setelah selesai, buka CMD dan ketik:
   node -v dan npm -v → harus muncul versinya


✅ STEP 4: SIAPKAN Project Laravel & Vue
1. Copy folder `jogja-inside` ke:
   C:\xampp\htdocs\jogja-inside

2. Masuk ke folder Backend, lalu jalankan:
   cd C:\xampp\htdocs\jogja-inside\Backend
   composer install
   php artisan key:generate

3. Masuk ke folder Frontend, lalu jalankan:
   cd C:\xampp\htdocs\jogja-inside\frontend
   npm install
   npm run dev

✅ STEP 5: JALANKAN Project DENGAN MUDAH
Gunakan file berikut (disertakan):
📄 start-project.bat

Akan otomatis:
- Menjalankan Laravel backend
- Menjalankan Vue frontend


📌 CATATAN TAMBAHAN
- Jika error "openssl not available", edit php.ini dan aktifkan baris:
  extension=openssl

- Jika error "PHP version too low", pastikan PHP ≥ 8.1

