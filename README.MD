Selamat Siang,
Berikut adalah submit untuk tugas akhir dicoding: Proyek Implementasi Asynchronous Communication pada Aplikasi E-Commerce App
Untuk mempermudah penilaian, saya cantumkan informasi file beserta parameter penilaian:
1. Kriteria 1: Menggunakan Starter Project (E-Commerce App)
	- Saya menggunakan fork repo yang telah disediakan: https://github.com/geronimo794/a433-microservices
	- Untuk order service: https://github.com/geronimo794/a433-microservices/tree/order-service
	- Untuk shipping service: https://github.com/geronimo794/a433-microservices/tree/shipping-service
2. Kriteria 2: Mengunggah Container Image ke Docker Hub
	- Saya mengunggah Container ke Github Package
	- Untuk order service: https://github.com/users/geronimo794/packages/container/package/order-service
	- Untuk shipping service: https://github.com/users/geronimo794/packages/container/package/shipping-service
	- Untuk order Dockerfile: https://github.com/geronimo794/a433-microservices/blob/order-service/Dockerfile
	- Untuk shipping Dockerfile: https://github.com/geronimo794/a433-microservices/blob/shipping-service/Dockerfile
3. Kriteria 3: Deploy Aplikasi dengan Docker Compose
	- Untuk file konfigurasi Docker Compose dapat dilihat pada: https://github.com/geronimo794/a433-microservices/blob/deployment-asynchronous/docker-compose.yml

Penilaian:
1. Penjelasan dalam bentuk komentar
	- Sudah saya berikan komentar pada tiap file yml, file Dockerfile, dan bebberapa komentar pada script instalasi
2. GitHub Packages
	- Untuk order service: https://github.com/users/geronimo794/packages/container/package/order-service
	- Untuk shipping service: https://github.com/users/geronimo794/packages/container/package/shipping-service
3. Deploy aplikasi E-Commerce App menggunakan Kubernetes.
	- File manifest yaml dapat dilihat pada https://github.com/geronimo794/a433-microservices/tree/deployment-asynchronous/kubernetes
	- Untuk mempermudah proses juga saya sediakan script install.sh untuk flow proses deployment aplikasi ecommerce ke Kubernetes
	- Berikut dengan komentarnya
4. Mengimplementasikan service mesh dengan Istio pada aplikasi E-Commerce App di Kubernetes
	- Pada deployment kubernetes juga diimplementasikan juga Istio
	- Konfigurasinya dapat dilihat pada folder https://github.com/geronimo794/a433-microservices/tree/deployment-asynchronous/kubernetes/istio
	- Berikut dengan konfigurasi gateway dan virtual service:
	- Order Gateway: https://github.com/geronimo794/a433-microservices/blob/deployment-asynchronous/kubernetes/istio/order-gateway.yml
	- Order Virtual Service: https://github.com/geronimo794/a433-microservices/blob/deployment-asynchronous/kubernetes/istio/order-virtual-service.yml
	- RabbitMq Gateway: https://github.com/geronimo794/a433-microservices/blob/deployment-asynchronous/kubernetes/istio/rabbitmq-gateway.yml
	- RabbitMq Virtual Service: https://github.com/geronimo794/a433-microservices/blob/deployment-asynchronous/kubernetes/istio/rabbitmq-virtual-service.yml

Saya sertakan juga file, link.txt untuk informasi link github package.
https://github.com/geronimo794/a433-microservices/blob/deployment-asynchronous/link.txt

Mohon masukan dan feedbacknya jika ada beberapa hal yang belum sesuai dengan Kriteria inti dan Penilaian tambahan.

Terimakasih
Ach Rozikin