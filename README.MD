Selamat Siang,
Berikut adalah submit untuk tugas akhir dicoding: Proyek Implementasi Asynchronous Communication pada Aplikasi E-Commerce App
Untuk mempermudah penilaian, saya cantumkan informasi file beserta parameter penilaian:
1. Kriteria 1: Menggunakan Starter Project (E-Commerce App)
	- Saya menggunakan fork repo yang telah disediakan: https://github.com/geronimo794/a433-microservices 

2. Kriteria 2: Membuat Script untuk Build dan Push Docker Image
	- Build script untuk frontend ada di: https://github.com/geronimo794/a433-microservices/blob/karsajobs-ui/build_push_image_karsajobs_ui.sh
	- Build script untuk backend ada di: https://github.com/geronimo794/a433-microservices/blob/karsajobs/build_push_image_karsajobs.sh

3. Kriteria 3: Deploy Aplikasi ke Kubernetes
	- Untuk direktory berkas, saya tambahkan pada branch baru kubernetes di: https://github.com/geronimo794/a433-microservices/tree/kubernetes
	- Mohon maaf ada beberapa file yang mungkin tidak bersangkutan dengan penilaian
	- File tersebut adalah hasil proses debugging

Penilaian:
1. Penjelasan dalam bentuk komentar
	- Sudah saya berikan komentar pada tiap file yml dan proses build pada build_push_image_karsajobs_ui.sh dan build_push_image_karsajobs.sh
	- Tiap file yaml juga sudah diberikan komentar dan penjelasan
2. GitHub Packages
	- Proses deployment sudah menggunakan github package. Informasi tersebut dapat di cek pada build_push_image_karsajobs_ui.sh dan build_push_image_karsajobs.sh
	- Link github package BE: https://github.com/users/geronimo794/packages/container/package/karsajobs
	- Link github package FE: https://github.com/users/geronimo794/packages/container/package/karsajobs-ui
3. Mengimplementasikan monitoring dengan deploy Prometheus dan Grafana di Kubernetes
	- Bukti file monitoring dapat dicek pada: https://github.com/geronimo794/a433-microservices/blob/kubernetes/monitoring/monitoring.txt
	- Bukti screenshot monitoring grafana dapat dicek pada: https://github.com/geronimo794/a433-microservices/blob/kubernetes/monitoring/monitoring.png
	- Proses development Promotheus dan Grafana ada pada folder: https://github.com/geronimo794/a433-microservices/tree/kubernetes/monitoring
4. Menerapkan Continuous Integration untuk branch karsajobs dan karsajobs-ui.
	- Menggunakan circle ci untuk proses CI
	- File konfigurasi untuk backend ada di: https://github.com/geronimo794/a433-microservices/blob/karsajobs/.circleci/config.yml
	- Pada BE sudah menerapkan: lint-dockerfile, test-app, dan build-app-karsajobs
	- File konfigurasi untuk frontend ada di: https://github.com/geronimo794/a433-microservices/blob/karsajobs-ui/.circleci/config.yml
	- Pada FE sudah menerapkan: lint-dockerfile, dan build-app-karsajobs-ui

Mohon masukan dan feedbacknya jika ada beberapa hal yang belum sesuai dengan Kriteria inti dan Penilaian tambahan.

Terimakasih
Ach Rozikin