# idena-autoupdate-node
Ini adalah script untuk auto update node idena untuk vps linux

usage :

1. Stop semua node terlebih dahulu
2. Clone repository ini dengan cara :
    ```
    git clone https://github.com/codev911/idena-autoupdate-node
    ```
3. Pindahkan file `autoupdate.sh` ke lokasi node kalian
4. Beri perijinan kepada file `autoupdate.sh` e dengan cara :
    ```
    chmod +x autoupdate.sh
    ```
5. Jalankan file `autoupdate.sh` e pakai screen dengan cara : 
    ```
    screen -S idenaauto ./autoupdate.sh
    ```

NB : untuk melihat aktifitas screen dari auto update tinggal `screen -r idenaauto`, sedangkan ingin mengecheck nodenya jalan apa gk dengan cara `screen -r idenanode`
