# a433-microservices
Repository ini digunakan untuk kebutuhan kelas Belajar Membangun Arsitektur Microservices

Silakan clone dengan perintah berikut.<br>
`git clone -b proyek-pertama https://github.com/dicodingacademy/a433-microservices.git`

# Dicoding Submission - ACH ROZIKIN
Berikut adalah submission mengenai Docker saya.
Guna mempermudah penilaian, saya lampirkan berkas penilaian beserta dengan indikator yang di Nilai
1. Kriteria 1: Menggunakan Starter Project
	- https://github.com/geronimo794/a433-microservices/tree/proyek-pertama adalah hasil fork dari repository https://github.com/dicodingacademy/a433-microservices 
2. Kriteria 2: Membuat Berkas Dockerfile
	- Dockerfile terdapat pada: https://github.com/geronimo794/a433-microservices/blob/proyek-pertama/Dockerfile
3. Kriteria 3: Membuat Script untuk Build dan Push Docker Image
	- Automation build script: https://github.com/geronimo794/a433-microservices/blob/proyek-pertama/build_push_image.sh. Untuk menggunakan script tersebut, pengguna perlu mengisi dan menyesuaikan file .env terlebih dahulu
4. Kriteria 4: Menggunakan Docker Compose
	- Docker Compose: https://github.com/geronimo794/a433-microservices/blob/proyek-pertama/docker-compose.yml. Untuk menggunakan docker compose, pengguna perlu mengisi dan menyesuaikan file .env terlebih dahulu. Untuk memudahkan konfigurasi pengguna secara terpusat.

Penilaian:
1. Memberikan penjelasan dalam bentuk komentar.
	- Sudah ditambahkan tiap komentar pada Dockerfile, build_push_image.sh, dan docker-compose.yml. Mohon maaf jika sebagian komentar dalam bahasa inggris, agar mempermudah penggunaan istilah yang sesuai.
2. Menerapkan restart policy pada berkas docker-compose.yml.
	- Sudah ditambahkan pada file https://github.com/geronimo794/a433-microservices/blob/proyek-pertama/docker-compose.yml pada line 9 dan 34
3. Menyertakan berkas log.txt yang berisi logs
	- Berkas log.txt terdapat pada https://github.com/geronimo794/a433-microservices/blob/proyek-pertama/log.txt. Berkas tersebut digenerate menggunakan perintah: "docker compose logs > log.txt"
4. Menggunakan GitHub Packages (GitHub Container Registry) untuk penyimpanan image
	- Berikut adalah link dari package yang telah diunggah ke Container Registry Github: https://github.com/users/geronimo794/packages/container/package/item-app

Mohon koreksi jika ada kesalahan instruksi atau ketidak sesuaian dengan parameter penialaian.

Terimakasih, mohon bantuannya.