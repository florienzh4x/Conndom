# Conndom - Random Connection Helper

Conndom (connection random) - Project ini dibuat karena waktu itu disuruh stress test ketahanan server, namu server tersebut menggunakan fail2ban, untuk menghindari block server saya menambahkan beberapa script, namun untuk mendapatkan 1 line random proxy dan user agent di BASH itu memakan puluhan line bahkan ratusan. Kemudian saya berinisiatif untuk membuat supaya menjadi 1 line saja, yaitu dengan cara dijadikan helper tool. Selain digunakan untuk helper tool, tool ini juga dapat digunakan untuk mendapatkan proxy gratis yang koneksinya lumayan cepat. Maaf namanya sedikit "cabul" karena menggunakan nama yang mirip dengan alat kontrasepsi. But it's conndom not condom.

Kegunaan:
- Random Proxy
- Random User Agent
- Get Live Proxy

Untuk limit penggunaan proxy menggunakan batasan waktu 1 jam. Kedepannya mungkin akan dibuat supaya bisa di-configure limitnya.

### Instalasi:
```
git clone https://github.com/panophan/Conndom.git
cd Conndom
chmod +x setup.sh
sudo ./setup.sh
```

### Penggunaan:
- conndom --help
- conndom --proxy-create
Untuk mengenerate proxy (live) baru
- conndom --proxy-lists
Untuk melihat proxy yang telah digenerate
- conndom --proxy-rand
Untuk mengeluarkan output 1 proxy, proxy tersebut mengambil dari data pada proxy list. Command ini digunakan sebagai helper tool untuk seperti curl dan lain-lain.
```curl --proxy $(conndom --proxy-rand) http://targetweb.com/```
- conndom --ua-rand
Untuk mengeluarkan output 1 random user agent. Command ini digunakan sebagai helper tool untuk seperti curl dan lain-lain.

### Changelog
2.0 : Added Multi-thread process
