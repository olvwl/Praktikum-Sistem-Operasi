total=0;
indexnama=0
indexno_tlp=0
indexalamat=0
indextglbeli=0
indexsepatu1=0
indexsepatu2=0
indexjumlahsepatu=0
indexharga1=0;
indexharga2=0;
indexukuran1=0
indexukuran2=0
indexmodel=0
x=0

declare -a model
declare -a ukuran1
declare -a ukuran2
declare -a jumlah_sepatu1
declare -a jumlah_sepatu2
declare -a nama_pembeli
declare -a no_telepon
declare -a alamat
declare -a tgl_beli
declare -a nama_sepatu
declare -a harga_sepatu1
declare -a harga_sepatu2

data(){
        
        echo "Nama Pembeli :";
        read nama_pembeli[$indexnama];
        let indexnama=$indexnama+1;
        echo "Tanggal Pembelian :";
        read tgl_beli[$indextglbeli];
        let indextglbeli=$indextglbeli+1;
        echo "No Telepon : ";
        read no_telepon[$indexno_tlp];
        let indexno_tlp=$indexno_tlp+1;
        echo "Alamat :";
        read alamat[$indexalamat];
        let indexalamat=$indexalamat+1;
        echo "Model? "
        read model[$indexmodel]
        let indexmodel=$indexmodel+1
        
            if [ ${model[$x]} == 1 ]
                then        
                echo "Sepatu A : "
                read harga_sepatu1[$indexharga1]
                let indexharga1=$indexharga1+1
                echo "Jumlah Sepatu : "
                read jumlah_sepatu1[$indexsepatu1]
                let indexsepatu1=$indexsepatu1+1
                echo "Ukuran : "
                read ukuran1[$indexukuran1]
                let indexukuran1=$indexukuran1+1

            elif [ ${model[$x]} == 2 ]
                then

                    echo "Sepatu A : "
                    read harga_sepatu1[$indexharga1]
                    let indexharga1=$indexharga+1
                    echo "Jumlah Sepatu : "
                    read jumlah_sepatu1[$indexsepatu1]
                    let indexsepatu1=$indexsepatu1+1
                    echo "Ukuran : "
                    read ukuran1[$indexukuran1]
                    let indexukuran1=$indexukuran1+1

                    echo "Sepatu B : "
                    read harga_sepatu2[$indexharga2]
                    let indexharga2=$indexharga+1
                    echo "Jumlah Sepatu : "
                    read jumlah_sepatu2[$indexsepatu2]
                    let indexsepatu2=$indexsepatu2+1
                    echo "Ukuran : "
                    read ukuran2[$indexukuran2]
                    let indexukuran2=$indexukuran2+1
                    
            fi
        let x+=1
menu
}


view() {
    declare -a total
    for (( i = 0; i < $indexnama; i++ ))
    do    
        echo "==================================================="
        echo "            DATA PENJUALAN Ke - $(( $i+1 ))                "
        echo "===================================================" 
        echo "Nama Pembeli: ${nama_pembeli[$i]}"
        echo "Tgl Pembelian : ${tgl_beli[$i]}"
        echo "No Telepon : ${no_telepon[$i]}"
        echo "Alamat : ${alamat[$i]}"
        echo "Model : ${model[$i]}"

            if [ ${model[$i]} == 1 ]
                 then
                     echo "Sepatu A : ${harga_sepatu1[$i]}"
                     echo "Jumlah : ${jumlah_sepatu1[$i]}"
                     let total[$i]+=${harga_sepatu1[$i]}*${jumlah_sepatu1[$i]}
                     echo "Ukuran :  ${ukuran1[$i]}"
                     echo "Total Belanja : ${total[$i]}"

            elif [ ${model[$i]} == 2 ]
                 then 
                      echo "Sepatu A : ${harga_sepatu1[$i]}"
                      echo "Jumlah : ${jumlah_sepatu1[$i]}"
                      echo "Ukuran : ${ukuran1[$i]}" 
                      echo "Sepatu B : ${harga_sepatu2[$i]}"
                      echo "Jumlah : ${jumlah_sepatu2[$i]}"
                      echo "Ukuran : ${ukuran2[$i]}"
             
                      let total1=${harga_sepatu1[$i]}*${jumlah_sepatu1[$i]}
                      let total2=${harga_sepatu2[$i]}*${jumlah_sepatu2[$i]}
                      
                      let total[$i]+=$total1+$total2
                      echo "Total Belanja : ${total[$i]}"
              fi          
    done 
}
menu() {

    while :; do
        echo  " == Program Pembelian Toko Sepatu == ";
        echo  "1. Input Data Pembeli";
        echo  "2. View Data Sepatu";
        echo  "3. Liat Tempat Penyimpanan Program" 
        echo  "4. Ubah Hak Akses"
        echo  "5. Exit"
        echo  "Pilihan :"
        read pilih;

        if [ $pilih == 1 ]
        then
            data
        elif [ $pilih == 2 ]
        then
            view
        elif [ $pilih == 3 ]
        then
            echo "Cari direktori penyimpanan program?"
            read dir
            cd $dir
            ls -l 
        elif [ $pilih == 4 ]
        then
            clear
            echo "Mau ubah hak akses program? (y/n)"
            read pilihan

                if [ $pilihan == "y" ]
                then

                    echo "Masukkan nama file? "
                    read nama_file
                    sudo chmod 777 $nama_file
                    
                    ls -l $nama_file
                    read
                    echo "Hak akses berkas telah diubah"
                else 
                    menu
                fi  
        elif [ $pilih == 5 ]
        then
            exit                 
        fi
    done
}
menu
