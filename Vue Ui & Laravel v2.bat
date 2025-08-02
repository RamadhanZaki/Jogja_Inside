@echo off
echo Menjalankan Laravel Backend...

:: Jalankan Laravel secara minimize
cd /d C:\xampp\htdocs\jogja-inside\Backend
powershell -windowstyle hidden start cmd -ArgumentList '/c php artisan serve'

echo Menjalankan Vue Frontend...

:: Jalankan Vue secara minimize
cd /d C:\xampp\htdocs\jogja-inside\Frontend
powershell -windowstyle hidden start cmd -ArgumentList '/c npm run serve'

:: Tunggu beberapa detik agar server siap
timeout /t 8 >nul

:: Buka browser default untuk Laravel dan Vue
start "" http://localhost:8080

exit
