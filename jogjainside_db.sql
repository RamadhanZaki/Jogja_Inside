-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2025 at 04:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jogjainside_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `location` text NOT NULL,
  `ticket_price` text NOT NULL,
  `facilities` text NOT NULL,
  `maps` text NOT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `region` varchar(255) NOT NULL,
  `background` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `tiktok` varchar(255) DEFAULT NULL,
  `x` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`id`, `name`, `slug`, `description`, `location`, `ticket_price`, `facilities`, `maps`, `rating`, `label`, `category`, `thumbnail`, `region`, `background`, `whatsapp`, `instagram`, `tiktok`, `x`, `created_at`, `updated_at`) VALUES
(34, 'Bukit Paralayang', 'bukit-paralayang', 'Bukit Paralayang, yang juga dikenal sebagai Bukit Watugupit atau Bukit Paralayang Parangtritis, menawarkan pemandangan spektakuler Laut Selatan dari ketinggian sekitar 900 mdpl. Bukit ini merupakan destinasi favorit bagi penggemar olahraga paralayang menghadirkan sensasi terbang dengan pemandangan pesisir serta bagi pecinta panorama langit senja yang dramatis. Area berlatar hijau perbukitan dan semilir angin laut menciptakan suasana yang tenang dan instagramable. Banyak pengunjung datang untuk camping ringan, piknik, fotografi alam, atau sekadar menantikan matahari terbenam dengan nuansa berbeda.', 'Lokasi: Dusun Watugupit (Desa Giricahyo), Kecamatan Purwosari, Gunungkidul, tepat di perbatasan dengan Kecamatan Kretek, Bantul. \r\n\r\nRute dari Kota Yogyakarta:\r\nBerkendara sekitar 30 km (~1 jam). Ikuti rute Malioboro → Brigjen Katamso → Jalan Parangtritis. Setelah gerbang Pantai Parangtritis (biaya Rp 10.000/orang), lanjutkan ke kanan dan mengikuti petunjuk ke bukit sejauh ±2 km tanjakan. \r\nBisa juga naik transportasi online (ojek/taksi, Rp 85.000–150.000 sekali jalan).', 'Tiket masuk: Rp 5.000/orang.\r\n\r\nParkir: Rp 2.000–5.000 untuk sepeda motor/mobil. \r\nBiaya paralayang: Mulai Rp 300.000 hingga Rp 400.000/orang, sudah termasuk instruktur. \r\nJam operasional: Biasanya buka dari pagi (08.00 atau 07.00) hingga sekitar pukul 20.00–22.00.', 'Landasan beton paralayang sejak 1991\r\nParkiran luas dan akses jalan menanjak namun beraspal\r\nPendopo/joglo, tangga naik\r\nArea warung tenda sederhana dengan makanan dan minuman\r\nToilet dan MCK dasar\r\nBeberapa spot duduk dan gardu pandang untuk menikmati panorama\r\nCocok juga untuk camping, hiking pendek, dan berburu foto senja', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3950.728985728421!2d110.34333727500751!3d-8.02685509199976!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7baa1254b588c1%3A0xd78b48bf093653cc!2sBukit%20Paralayang%20Watugupit!5e0!3m2!1sen!2sid!4v1750647241222!5m2!1sen!2sid', 5, NULL, 'Alam Terbuka', 'uploads/thumbnail/P5IFeMi9gqOEAGDkmMtmp8TZmmAJfIMRFtP7OPXQ.jpg', 'Bantul', 'uploads/backgrounds/kKeURvo4wxrG7ZKvAw3Syb4mwcaZzHecmgz2onwg.jpg', NULL, NULL, NULL, NULL, '2025-06-22 20:16:54', '2025-06-22 20:16:54'),
(35, 'Bukit Lintang Sewu', 'bukit-lintang-sewu', 'Bukit Lintang Sewu yang berarti “Seribu Bintang” adalah destinasi alam baru di Desa Muntuk, Kecamatan Dlingo, Bantul. Dikelilingi oleh hutan pinus dan kayu putih, bukit ini menawarkan atmosfer sejuk dan menenangkan, ideal untuk bersantai, camping ringan, atau glamping. Puncaknya menyuguhkan panorama sunset luar biasa, city-light Jogja berkelap-kelip di malam hari, serta langit malam yang penuh bintang. Terdapat banyak spot foto kekinian seperti gardu pandang bambu, gapura, rumah terbalik, dan jembatan kayu sangat Instagramable.', 'Alamat: Desa Muntuk, Kecamatan Dlingo, Kabupaten Bantul, Daerah Istimewa Yogyakarta \r\n\r\nRute:\r\nDari Malioboro (±24 km, ±50–60 menit): melalui Jl. Brigjen Katamso → Jl. Imogiri Barat → menuju ke Hutan Pinus Mangunan → lurus sekitar 500 m menuju Bukit Lintang Sewu', 'Tiket masuk: Rp 5.000/orang \r\n\r\nParkir: Motor Rp 2.000, Mobil Rp 3.000–5.000 \r\n\r\nJam buka: 07:00–22:00 atau 08:00–21:00 (beberapa sumber mencantumkan rentang pukul tersebut)', 'Spot foto & gardu pandang: Banyak pilihan seperti jembatan kayu, gardu bambu, rumah terbalik, tugu gapura, dan “Tapak Butho” \r\n\r\nCamping & glamping: Tersedia area camping gratis, serta paket glamping mulai Rp 350.000–500.000/malam, beberapa dilengkapi kasur, peralatan masak, toilet (umumnya di luar kamar ±15 m) \r\n\r\nFasilitas umum: Toilet, mushola, gazebo, warung/food stall, parkir luas, area outbound, jalan akses menanjak beraspal', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3951.80148467821!2d110.4320301685108!3d-7.915794361324388!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7a53828cd3eced%3A0x87a0debce17a6da7!2sBukit%20Lintang%20Sewu!5e0!3m2!1sen!2sid!4v1750648989908!5m2!1sen!2sid', 4, 'Nature Escape', 'Alam Terbuka', 'uploads/thumbnail/gL5oh3rgYRY1yw0MHC57N1J0lP9e7DsTjfX6PEjI.jpg', 'Bantul', 'uploads/backgrounds/OLbgSamuZ0DTty8RYxOdwwGjbFSJXGFbpX8rxPaE.jpg', NULL, NULL, NULL, NULL, '2025-06-22 20:26:47', '2025-06-22 20:26:47'),
(36, 'Gumuk Pasir Parangkusumo', 'gumuk-pasir-parangkusumo', 'Gumuk Pasir Parangkusumo, sering disebut “gurun pasir” di Bantul, adalah fenomena alam langka berupa jajaran gundukan pasir pantai yang mirip padang gurun. Terbentuk dari material vulkanik Gunung Merapi yang diendapkan di pantai selatan oleh sungai dan angin, lalu menyatu membentuk tebing pasir unik \r\nPengunjung bisa merasakan sensasi sandboarding, jelajah dengan jeep atau ATV, serta menikmati panorama matahari terbenam yang dramatis. Aktivitas fotografi, prewedding, dan petualangan ringan seperti menunggang kuda juga populer di kawasan ini', 'Alamat: Jl. Pantai Parangkusumo, Kalurahan Parangtritis, Kapanewon Kretek, Kab. Bantul, DI Yogyakarta \r\nJarak: ±25–28 km dari pusat Yogyakarta (1–1,5 jam berkendara) \r\nRute: Ambil Jalan Parangtritis, setelah Jembatan Kretek dan sebelum pos pantai Parangtritis, belok kanan ikuti papan arah menuju gumuk pasir', 'Tiket masuk: Rp 5.000/orang \r\nParkir: Motor Rp 2.000–5.000, mobil Rp 5.000–10.000, bus/elf Rp 25.000 \r\nJam buka: Umum 07.00–18.00, beberapa tempat buka sampai 17.00 (izin khusus untuk sore)', 'Area parkir luas dan toilet umum\r\nWarung sederhana di sekitar lokasi \r\nSpot foto, taman bunga di beberapa titik\r\nPenawaran sewa papan sandboarding, ATV, jeep, motor trail \r\nBeberapa jasa petualangan tambahan: paramotor, kuda tunggang', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3950.81072352037!2d110.31697597380943!3d-8.01844468002525!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7b009013455d2f%3A0x22e1771beec2dd40!2sGumuk%20Pasir%20Parangkusumo!5e0!3m2!1sen!2sid!4v1750649493738!5m2!1sen!2sid', 4, NULL, 'Alam Terbuka', 'uploads/thumbnail/iRf6MftmDbNysqc3oa6DgIyG1BKLBf7IJGgWrotu.jpg', 'Bantul', 'uploads/backgrounds/b7BrvPAWQCm1JQ7gbxttDq0j1dp4OnhVmrWcTWX8.jpg', NULL, NULL, NULL, NULL, '2025-06-22 20:35:03', '2025-06-22 20:35:03'),
(37, 'Hutan Pinus Mangunan', 'hutan-pinus-mangunan', 'Hutan Pinus Mangunan, disebut juga Hutan Pinus Imogiri secara administratif, adalah kawasan hutan lindung yang dulunya tandus dan kemudian direhabilitasi menjadi hamparan rimbun pohon pinus, akasia, mahoni, dan kayu putih \r\n\r\nKeunikan tempat ini terletak pada suasana asri dan sejuk, dengan jalan setapak di antara barisan pohon tinggi yang menjulang. Di sini tersedia banyak spot foto Instagramable, seperti rumah pohon, panggung kayu amphitheater, gardu pandang, sarang burung, dan spot “tangan dewa” \r\n\r\nSelain jadi spot foto, hutan ini cocok untuk refreshing, camping, sekolah hutan, outbond, maupun offroad jeep/ ATV menjelajahi area', 'Alamat: Sukorame, Mangunan, Kecamatan Dlingo, Kabupaten Bantul, DI Yogyakarta \r\n\r\nJarak: ±24–25 km dari pusat Kota Yogyakarta, waktu tempuh sekitar 50–60 menit berkendara via Imogiri Timur ➝ Kebun Buah Mangunan ➝ Hutan Pinus', 'HTM: Sekitar Rp 3.000–7.000/orang (sumber bervariasi) .\r\n\r\nParkir: Motor Rp 3.000, mobil Rp 5.000–10.000 \r\nJam buka: Umum setiap hari pukul 06.00–18.00 WIB', 'Parkir luas, toilet, mushola, dan warung di area parkir \r\n\r\nvisitingjogja.jogjaprov.go.id\r\nGardu pandang, panggung kayu amphitheater, gazebo, kursi kayu, serta area camping \r\nSpot foto kekinian seperti sarang burung, rumah pohon, tangan dewa \r\nFasilitas edukatif seperti sekolah hutan dan sumber mata air Bengkung yang dipercaya untuk pertapaan', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63224.73448557422!2d110.38430584866035!3d-7.942400462499266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7a54a752980ddd%3A0x8eb811b6962c6cd5!2sMangunan%2C%20Dlingo%2C%20Bantul%20Regency%2C%20Special%20Region%20of%20Yogyakarta!5e0!3m2!1sen!2sid!4v1750650175573!5m2!1sen!2sid', 4, 'Nature Escape', 'Alam Terbuka', 'uploads/thumbnail/lVaiSmZTcuj7HpMHJQ0OeEKsFFok2UIWHOpF8nLO.jpg', 'Bantul', 'uploads/backgrounds/Eve4zPJoUImbJ6qxXYio7wUCEGtZ1xuV0ZTX8OGF.jpg', NULL, NULL, NULL, NULL, '2025-06-22 20:47:18', '2025-06-22 20:47:18'),
(38, 'Pantai Jungwok', 'pantai-jungwok', 'Pantai Jungwok adalah permata tersembunyi di ujung timur Deretan Pantai Gunungkidul. Bernuansa sepi dan asri, pantai ini menawarkan hamparan pasir putih lembut dikelilingi tebing karst, serta pulau karang menawan (Sering disebut \"Pulau Batu\") yang menambah pesona ala Tanah Lot versi Jawa \r\njogjakeren.com Ombak relatif tenang karena dibendung formasi karang, cocok untuk healing, memancing, camping, dan foto-foto. Sinar matahari pagi dan sore memberikan panorama yang dramatis, menjadikannya spot favorit untuk sunrise dan sunset \r\ntelkomsel.com', 'Alamat: Desa Jepitu, Kecamatan Girisubo (sering disebut Tanjungsari), Gunungkidul, Yogyakarta \r\njogja.travel\r\n\r\nJarak: Sekitar 75–80 km dari pusat Kota Yogyakarta (~2 jam berkendara) \r\nRute: Yogyakarta → Wonosari → Semanu → Jalan Wediombo → Pantai Wediombo → lanjut jalan kaki ±1 km menyusuri jalur setapak (melalui pandan & kebun) menuju Jungwok', 'Tiket masuk: Rp 5.000–10.000/orang (tergantung kebijakan, termasuk retribusi ke Wediombo) \r\n\r\nParkir: Motor Rp 2.000–3.000, mobil Rp 3.000–5.000 \r\nJam operasional: 24 jam sehari, cocok bagi pengunjung yang ingin beach camping', 'Umum: Area parkir di Wediombo, toilet umum, beberapa warung kecil \r\n\r\nDi Pantai Jungwok: Area camping, penyewaan tenda, kursi beton/viewing deck, mushola, gazebo, kayu bakar untuk api unggun \r\nJungwok Blue Ocean: Spot ala Santorini (bangunan putih-biru, kolam mini), spot foto estetik; tiket tambahan Rp 30.000 (hari biasa) – Rp 35.000 (weekend)', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15800.209880401026!2d110.42474852878395!3d-8.096131976929316!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7baf39ad03012f%3A0x7fc75f89bcd7f418!2sPantai%20Kesirat!5e0!3m2!1sen!2sid!4v1750650751120!5m2!1sen!2sid', 4, 'Nature Escape', 'Pantai', 'uploads/thumbnail/8lk3wflrJXhRcntGrZYi3Z086yC7Ou0JybFz6U8I.jpg', 'GunungKidul', 'uploads/backgrounds/jP2tjhD2zenMzY4nl52uoivJy0E66AEdEmwFjN8Q.jpg', NULL, NULL, NULL, NULL, '2025-06-22 20:57:39', '2025-06-22 20:57:39'),
(39, 'Pantai Slili,', 'pantai-slili', 'Pantai Slili, juga dikenal sebagai Pantai Watu Lawang atau Cinta Slili, adalah pantai mungil memikat di antara Pantai Krakal dan Pantai Sadranan, Gunungkidul. Panjang garis pantainya kurang dari 100 m, tetapi keindahannya luar biasa—pasir putih halus dan air laut biru jernih menciptakan suasana tenang dan menenangkan \r\n Ada pula ikon \"Batu Cinta\" (prasasti hati) serta area hiasan seperti bunga dan pohon sakura yang menambah daya tariknya', 'Alamat: Desa Sidoharjo, Kecamatan Tepus, Kabupaten Gunungkidul, Yogyakarta \r\nJarak: Sekitar 60 km–75 km dari Yogyakarta, membutuhkan waktu tempuh 1,5–2 jam \r\nRute:\r\nYogyakarta → Wonosari → Pantai Baron\r\n\r\nSetelah pos TPR Baron, belok kiri ke Kukup/Krakal\r\n\r\nDi pertigaan Krakal ambil arah ke Slili sesuai papan petunjuk\r\n\r\nParkir dan jalan kaki singkat menuju area pantai', 'Tiket masuk: Rp 10.000/orang \r\nParkir: Motor Rp 2.000, Mobil Rp 5.000–10.000, Bus Rp 20.000 \r\nBiaya tambahan:\r\nSnorkeling: Rp 50.000 • Gazebo: Rp 20.000 • Foto spot: Rp 10.000 \r\nJam buka: 24 jam setiap hari', 'Toilet, kamar mandi, mushola \r\nGazebo & kursi pinggir pantai \r\nWarung makan & café ala beach club (Cafe De’Slili) \r\nArea parkir luas, penginapan, dan camping ground \r\nPenyewaan alat snorkeling, kursi, payung', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15798.28930070079!2d110.59257682879804!3d-8.144944878754416!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7bba307708ac97%3A0x33dc2d30ad1147f1!2sPantai%20Slili!5e0!3m2!1sen!2sid!4v1750651390136!5m2!1sen!2sid', 4, 'Nature Escape', 'Pantai', 'uploads/thumbnail/knmmWgn33GERQgjujJSzhR07roV2yDqpjR8kTzHk.webp', 'GunungKidul', 'uploads/backgrounds/jsKcjxZgNRMFQMNWVMn9shjAen8vlXg9rJ0Q4cvT.jpg', NULL, NULL, NULL, NULL, '2025-06-22 21:05:01', '2025-06-22 21:05:01'),
(40, 'Pantai Gesing', 'pantai-gesing', 'Pantai Gesing adalah pantai nelayan tersembunyi di Dusun Bolang, Desa Girikarto, Kecamatan Panggang, Gunungkidul. Dikelilingi tebing karang di kiri dan kanan, pantai ini menawarkan suasana tenang dan privat, dengan pasir putih bersih dan air laut jernih bergradasi hijau–biru \r\n\r\n Banyak kapal nelayan berlabuh dan spot memancing melimpah, cocok untuk pemancing dan pecinta seafood. Dari tebing, pengunjung bisa menikmati panorama keseluruhan, termasuk berbagai instalasi foto seperti jembatan cinta dan perahu kayu', 'Alamat: Dusun Bolang, Desa Girikarto, Kecamatan Panggang, Kabupaten Gunungkidul, DIY\r\n\r\nJarak: Sekitar 40–45 km (~1–1,5 jam berkendara) dari Yogyakarta \r\nRute:\r\n\r\nYogyakarta → Ringroad Selatan → Imogiri Timur → Selopamioro → Panggang\r\n\r\nLanjut menuju Jalan Jalur Selatan (JJLS) → Rest Area Sawah & pohon besar → Bolang → Gesing', 'HTM: Rp 4.000–5.000/orang, beberapa sumber menyebut Rp 10.000 \r\nParkir: Motor Rp 2.000–3.000, mobil Rp 5.000–10.000, bus Rp 20.000 \r\n\r\nJam buka: 24 jam setiap hari', 'Area parkir luas, toilet, dan musholla \r\n\r\nWarung makan & penjual seafood segar (hasil tangkapan lokal) \r\n\r\nStadion pelelangan ikan (TPI) aktif saat musim nelayan \r\n\r\nJalan setapak dan jembatan cinta di tebing sebagai spot foto \r\n\r\n\r\nCamping ground sederhana & penyewaan perahu nelayan untuk pengalaman lokal', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3949.9303721093215!2d110.46536177381103!3d-8.108572481121495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7baf7729055893%3A0xfaf1f0102bac9342!2sPantai%20Gesing!5e0!3m2!1sen!2sid!4v1750651742331!5m2!1sen!2sid', 4, 'Nature Escape', 'Pantai', 'uploads/thumbnail/xm0enhRTORYPjsyrtrYxGh4RuVhZo9iNI6MHUqpd.jpg', 'GunungKidul', 'uploads/backgrounds/7zDONXVMoccDAw9Mzwgit7scZrjqN53EHr0ljWi5.jpg', NULL, NULL, NULL, NULL, '2025-06-22 21:10:20', '2025-06-22 21:10:20'),
(41, 'Pantai Mbuluk', 'pantai-mbuluk', 'Pantai Mbuluk adalah hidden gem kecil di Gunungkidul, berlokasi di Desa Kemadang, Kecamatan Tanjungsari, sebelah timur Pantai Baron \r\n\r\n Meski garis pantainya hanya sekitar 25 meter, keindahannya menawan: pasir putih lembut, air laut jernih, dan dua tebing karang besar yang menjadi ikon \r\n Di samping itu, terdapat gua karang dan kolam alami ideal untuk snorkeling atau berenang saat surut \r\nCocok untuk healing dengan suasana tenang—pengunjung juga bisa menikmati sunrise dan sunset dari bibir pantai atau puncak tebing', 'Alamat: Desa Kemadang (Rejosari), Kecamatan Tanjungsari, Kabupaten Gunungkidul, DIY \r\nJarak: ±60 km dari Yogyakarta (1–1,5 jam berkendara)\r\nRute: Yogyakarta → Imogiri Barat → Panggang → Jalan Pantai Selatan → melewati Pantai Baron → lanjut ±1 km ke Pantai Mbuluk', 'HTM: Rp 5.000–10.000/orang, rata-rata Rp 10.000 sudah berlaku untuk akses beberapa pantai (Baron, Kukup, dll.) \r\nParkir: Motor Rp 2.000–3.000, mobil Rp 5.000–10.000 \r\nOperasional: Buka 24 jam, ideal untuk pengunjung pagi dan sore', 'Parkir luas, toilet umum, mushola, dan warung sederhana \r\nGazebo, pendopo, dan beberapa spot foto seperti jembatan kayu dan gua karang \r\nAkses ke tebing/mercusuar dengan tangga berbayar Rp 3.000 untuk menikmati panorama laut dari atas .\r\nBeberapa penginapan homestay/gubuk tradisional di atas bukit—ideal untuk yang ingin bermalam', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15798.744145196659!2d110.54183782879475!3d-8.133410978321752!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7bba939264a28d%3A0x6074a5df0d37627e!2sMbuluk%20Beach!5e0!3m2!1sen!2sid!4v1750652079498!5m2!1sen!2sid', 4, 'Nature Escape', 'Pantai', 'uploads/thumbnail/b4Y6uymxpZ2ABlIbDbB4b89FNbhwWBDnZccqNRSb.jpg', 'GunungKidul', 'uploads/backgrounds/4WTseWS4JVKdmv2SGcXCdbKTI5raKlplvkJlHRZj.jpg', NULL, NULL, NULL, NULL, '2025-06-22 21:16:11', '2025-06-22 21:16:11'),
(42, 'Pantai Timang', 'pantai-timang', 'Pantai Timang adalah pantai eksotis yang terletak di utara antara Pantai Siung dan Sundak. Daya tarik utamanya adalah Pulau Panjang, sebuah batu besar di tengah laut—habitat lobster yang terkenal. Yang membuatnya beda adalah wahana ekstrem: gondola kayu tradisional manual serta jembatan gantung, digunakan nelayan untuk berburu lobster, kini jadi sensasi wisata adrenalin \r\nOmbak besar dan tebing karang menambah dramatis suasana, cocok untuk pencinta petualangan dan fotografi natural.', 'Alamat: Padukuhan Danggolo, Desa Purwodadi, Kecamatan Tepus, Gunungkidul, DIY \r\nJarak: Sekitar 35 km dari Wonosari atau 70–77 km (~2–3 jam) dari Kota Yogyakarta \r\nRute:\r\nYogyakarta → Wonosari → Baron → Mulo → Siung → Pasar Dakbong → Desa Purwodadi → Pantai Timang; jalan akhir masih berbatu dan tak ramah untuk mobil—motor atau ojek/jeep disarankan', 'Tiket masuk Pantai Timang: Rp 10.000/orang\r\nParkir: Motor Rp 3.000 • Mobil Rp 5.000 • Bus Rp 20.000 \r\nJam buka: Selasa–Kamis & Sabtu–Minggu 08.00–17.00 (tutup Jumat) \r\ntraveloka.com\r\nWahana ekstrem: Gondola tradisional Rp 150.000/orang (domestik), Rp 200.000 (wisman); Jembatan gantung Rp 100.000/orang domistik, Rp 150.000 asing \r\nTransportasi ke lokasi pantai: ojek Rp 50.000 per orang PP, jeep off‑road paketan Rp 350.000/jeep \r\ndiscoveryourindonesia.com\r\nFasilitas di area: Toilet, bilik mandi, warung sederhana, lahan parkir, spot foto dan gardu pandang', 'Fasilitas di area: Toilet, bilik mandi, warung sederhana, lahan parkir, spot foto dan gardu pandang', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3949.2661409906354!2d110.65984467381219!3d-8.175921281949291!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7bb36265782cf3%3A0x25efcb5e3a28afa8!2sTimang%20Beach!5e0!3m2!1sen!2sid!4v1750652473316!5m2!1sen!2sid', 4, 'Nature Escape', 'Pantai', 'uploads/thumbnail/WXkg2LhR7q6vePEDBiWr0cwHIRdbc3JMDMUwkmTO.jpg', 'GunungKidul', 'uploads/backgrounds/eR2ABNtLMEgFMLFIWvWJH4EEXtKWCIZWW9wSFnjG.jpg', NULL, NULL, NULL, NULL, '2025-06-22 21:22:25', '2025-06-22 21:22:25'),
(43, 'Pantai Siung', 'pantai-siung', 'Pantai Siung adalah salah satu destinasi andalan di Gunungkidul yang dikelilingi tebing karang tinggi. Tebing-tebing ini menyediakan sekitar 250 jalur panjat berstandar internasional—menjadikannya magnet bagi para pemanjat tebing lokal maupun mancanegara \r\n Di sela-selanya, hamparan pasir putih halus menghadap laut lepas yang biru, menciptakan kontras dramatis. Tebing berbatu tersebut juga menjadi asal nama “Siung”, karena menyerupai gigi kera atau siung wanara \r\nSelain panjat tebing, pantai ini cocok untuk camping, hiking pendek ke bukit, memancing, atau sekadar menikmati panorama sunrise dan sunset', 'Alamat: Dusun Duwet, Desa Purwodadi, Kecamatan Tepus, Kabupaten Gunungkidul, DIY — sekitar 75–80 km dari Kota Yogyakarta (±2–3 jam berkendara) \r\n\r\nRute utama:\r\n\r\nDari Yogya: ambil arah → Wonosari → Tepus → lewat Jalan Pantai Selatan → ikuti papan ke Pantai Siung \r\n\r\nJalur alternatif: via Imogiri → Panggang → Saptosari → Tanjungsari → Jalan ke tebing Pantai Siung \r\n\r\nAkses mudah dengan motor dan mobil; kendaraan umum hanya sampai Wonosari kemudian lanjut ojek', 'Tiket masuk: Rp 10.000/orang (termasuk retribusi ke Pantai Jogan & Nglambor) \r\nParkir: motor Rp 2.000–5.000; mobil Rp 5.000–10.000; bus sekitar Rp 10.000 \r\nalodiatour.com\r\nJam buka: area pantai buka 06.00–17.00, sedangkan camping ground tersedia 24 jam', 'Area parkir luas, toilet, dan mushola \r\nWarung makan sederhana; tersedia juga penginapan lokal mulai Rp 150.000–350.000/malam \r\ncampatour.com\r\nCamping ground dekat tepi pantai untuk tenda pribadi \r\nSpot panjat tebing lengkap, trail bukit, dan gardu pandang untuk foto', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3949.2035039975644!2d110.67858351853387!3d-8.182243863987605!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7bb8c8a5ee1c27%3A0x567f73117ae7ce4a!2sSiung%20Beach!5e0!3m2!1sen!2sid!4v1750652823849!5m2!1sen!2sid', 4, 'Nature Escape', 'Pantai', 'uploads/thumbnail/xYs7Z6iz4xqXPTShYvEqvlJRZaTup3OKM6ju4wyS.jpg', 'GunungKidul', 'uploads/backgrounds/6ykjIakqXqdZXiDx8gqMgxtIGKg0Otaf1JudsStD.jpg', NULL, NULL, NULL, NULL, '2025-06-22 21:29:43', '2025-06-22 21:29:43');

-- --------------------------------------------------------

--
-- Table structure for table `destination_media`
--

CREATE TABLE `destination_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `destination_id` bigint(20) UNSIGNED NOT NULL,
  `media_path` varchar(255) NOT NULL,
  `media_type` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `destination_media`
--

INSERT INTO `destination_media` (`id`, `destination_id`, `media_path`, `media_type`, `created_at`, `updated_at`) VALUES
(34, 34, 'uploads/media/8RXLUfS8PAUS5wFPRpnUHyN5Z0LfriSOcKqsosHh.jpg', 'image/jpeg', '2025-06-22 20:16:54', '2025-06-22 20:16:54'),
(35, 34, 'uploads/media/DUzdbaHcqJ5CWU1p8htIgAlHpEdpa2HRTI6LdMDp.jpg', 'image/jpeg', '2025-06-22 20:16:54', '2025-06-22 20:16:54'),
(36, 34, 'uploads/media/Cct6kLqZXdC5MnwfO4to77RkGRSSvszJKtE2RqIj.jpg', 'image/jpeg', '2025-06-22 20:16:54', '2025-06-22 20:16:54'),
(37, 35, 'uploads/media/paCpWaNX4AtDpQPSpTVHaHaU0eLQa0pWmp1SEHaV.jpg', 'image/jpeg', '2025-06-22 20:26:47', '2025-06-22 20:26:47'),
(38, 36, 'uploads/media/Gy5y4ZhC5yT6WvBhN3GDjanLKhXxAatrOo6ImU1A.jpg', 'image/jpeg', '2025-06-22 20:35:03', '2025-06-22 20:35:03'),
(39, 36, 'uploads/media/mvZ6pZtQK7O4cNX95jELxlebujyCdJ9lF5RfzdAj.jpg', 'image/jpeg', '2025-06-22 20:35:03', '2025-06-22 20:35:03'),
(40, 36, 'uploads/media/X581K06CVFSASricNfReijrP74cojyC96RJXrOtr.jpg', 'image/jpeg', '2025-06-22 20:35:03', '2025-06-22 20:35:03'),
(41, 36, 'uploads/media/EVbfVWUhM1630pLJapiUMYx253jdjaJYmby5Ve7g.jpg', 'image/jpeg', '2025-06-22 20:35:03', '2025-06-22 20:35:03'),
(42, 37, 'uploads/media/8DiFnJrlxbSa0URsaTAq7BorwRNwgujLDtPK4reD.jpg', 'image/jpeg', '2025-06-22 20:47:18', '2025-06-22 20:47:18'),
(43, 37, 'uploads/media/HY2ybUzQFJYgJQyeIBoyC5Te4Xi4CIPuXoS1NPFZ.jpg', 'image/jpeg', '2025-06-22 20:47:18', '2025-06-22 20:47:18'),
(44, 38, 'uploads/media/O3tQLsIjwG4fpFqY2BNPLI3vfNmDNy0KoGVGmbiX.jpg', 'image/jpeg', '2025-06-22 20:57:39', '2025-06-22 20:57:39'),
(45, 38, 'uploads/media/yskzvkCidw2YeLE8hhcXFPX2hr93nuvz3LVLTgLd.jpg', 'image/jpeg', '2025-06-22 20:57:39', '2025-06-22 20:57:39'),
(46, 39, 'uploads/media/znNrg6UZviNqeMQsmQx3VopSeNYxXMkzCDgsIoxx.jpg', 'image/jpeg', '2025-06-22 21:05:01', '2025-06-22 21:05:01'),
(47, 39, 'uploads/media/IEHdLvABnX2QHseW1zQ2TGpaqUstof37wDTHgnJk.jpg', 'image/jpeg', '2025-06-22 21:05:01', '2025-06-22 21:05:01'),
(48, 40, 'uploads/media/l9iEACB8RuETV1Y7l19AQvQYpNl1Pg2kG2Bz3pbN.jpg', 'image/jpeg', '2025-06-22 21:10:20', '2025-06-22 21:10:20'),
(49, 40, 'uploads/media/qtHqcW94TqOtSiQxlX9HeVZ5baOME48d0wsFhfAU.jpg', 'image/jpeg', '2025-06-22 21:10:20', '2025-06-22 21:10:20'),
(50, 41, 'uploads/media/TPyTNg5JfAKHuFLaGTPoXm43dZUOzvNZzkHiplL5.jpg', 'image/jpeg', '2025-06-22 21:16:11', '2025-06-22 21:16:11'),
(51, 41, 'uploads/media/GeVREql3pxqE2kM5neefmhaC5VzeW8t5IcvmmvW2.webp', 'image/webp', '2025-06-22 21:16:11', '2025-06-22 21:16:11'),
(52, 42, 'uploads/media/yBv6ogwexvCYqsZlhPNsR1Pq46stIMYBbPBzsaFV.jpg', 'image/jpeg', '2025-06-22 21:22:25', '2025-06-22 21:22:25'),
(53, 43, 'uploads/media/wn1bYuxxoikCZRurc3fYZ7BocSayrKrVeHZpahFE.jpg', 'image/jpeg', '2025-06-22 21:29:43', '2025-06-22 21:29:43'),
(54, 43, 'uploads/media/eZqkoV1HaEPgcXmXEVZPjhQryRFsmv0dR52sHXHl.jpg', 'image/jpeg', '2025-06-22 21:29:43', '2025-06-22 21:29:43');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_06_10_055954_create_user_table', 1),
(6, '2025_06_11_193527_create_teams_table', 1),
(7, '2025_06_12_153934_create_categories_table', 2),
(8, '2025_06_12_154120_create_destinations_table', 2),
(9, '2025_06_12_154216_create_destination_images_table', 2),
(10, '2025_06_13_111246_add_api_token_to_users_table', 3),
(11, '2025_06_15_182549_create_about_sections_table', 4),
(12, '2025_06_18_083405_create_categories_table', 5),
(13, '2025_06_18_083405_create_destinations_table', 5),
(14, '2025_06_18_083406_create_destination_images_table', 5),
(15, '2025_06_22_031632_create_destination_media_table', 6),
(16, '2025_06_22_031632_create_destinations_table', 6),
(17, '2025_06_22_041646_alter_media_type_column_on_destination_media_table', 7),
(18, '2025_06_22_055309_add_region_to_destinations_table', 8),
(19, '2025_06_22_060251_add_ticket_price_to_destinations_table', 9),
(21, '2025_06_22_132723_add_thumbnail_to_destinations_table', 10),
(22, '2025_06_22_212131_change_maps_column_type_in_destinations_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `job` varchar(255) NOT NULL,
  `github` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `img` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `job`, `github`, `instagram`, `img`, `created_at`, `updated_at`) VALUES
(21, 'Debi Saputra', 'Web Designer', 'https://github.com/DebiSaputra26', 'https://www.instagram.com/d3bisptr4_/', '/storage/teams/685586cd87d5d.webp', '2025-06-19 22:40:53', '2025-06-20 09:06:04'),
(22, 'Gregorius Jeffriyan F.S.', 'Front End Developer', 'https://github.com/Jeffriyan77', NULL, '/storage/teams/6854f58809fb6.webp', '2025-06-19 22:45:44', '2025-06-19 22:45:44'),
(23, 'Ahmad Kamil R.', 'Web Designer', 'https://github.com/kamill21', 'https://www.instagram.com/kamilrizqullah21/', '/storage/teams/6854f5e24594f.webp', '2025-06-19 22:47:14', '2025-06-19 22:47:14'),
(24, 'Nasiha Assakinah', 'Ui/Ux Designer', 'https://github.com/nasihaassakinah', 'https://www.instagram.com/nasihaass_/', '/storage/teams/6854f60c564ac.webp', '2025-06-19 22:47:56', '2025-06-19 22:47:56'),
(25, 'Aprilia Cindy N.S.', 'Ui/Ux Designer', 'https://github.com/Asyaa415', 'https://www.instagram.com/szaasyy/?igsh=MTRvOHp6OWo3ZXcybg%3D%3D#', '/storage/teams/6854f64036916.webp', '2025-06-19 22:48:48', '2025-06-21 01:41:37'),
(28, 'Catur Sunu Rahmadita', 'Full Stack Developer', 'https://github.com/Dito441', 'https://www.instagram.com/csr_441', '/storage/teams/68558556bb6b1.jpeg', '2025-06-19 23:02:23', '2025-06-22 22:30:28'),
(30, 'Ramadhan Zaki A.', 'Bagian Beli Esteh', 'https://github.com/RamadhanZaki', 'https://www.instagram.com/marzzukizaa', '/storage/teams/685576e89543f.webp', '2025-06-20 07:57:44', '2025-06-21 01:42:16');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `username`, `password`, `api_token`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Markolahh', 'marjukiazzaa@gmail.com', 'admin', '$2y$12$T8gjWQA0.m3ZbIolk0qcdOTDGS5RqSi6GxyBlf4FwBXg.JyIVvQc6', NULL, 'Super Admin', '2025-06-11 13:59:24', '2025-06-11 14:00:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `destination_media`
--
ALTER TABLE `destination_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destination_media_destination_id_foreign` (`destination_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_unique` (`email`),
  ADD UNIQUE KEY `user_username_unique` (`username`),
  ADD UNIQUE KEY `user_api_token_unique` (`api_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `destination_media`
--
ALTER TABLE `destination_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `destination_media`
--
ALTER TABLE `destination_media`
  ADD CONSTRAINT `destination_media_destination_id_foreign` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
