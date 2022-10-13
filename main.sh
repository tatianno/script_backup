#! /bin/bash

BASE_DIR=$(dirname $0)
source $BASE_DIR/config.ini


function verificar_unidade_montada(){
        DADOS_MONTAGEM=$(/bin/mount | grep $IP_SERVIDOR)
}


function montar_unidade(){
        /bin/mount -t cifs $PATH_REMOTO $PONTO_MONTAGEM -o username=$USERNAME,password=$PASSWORD
}


function verificar_montar_unidade(){
        verificar_unidade_montada

        if  [ $? = 1 ]
        then
                montar_unidade
                verificar_unidade_montada

                if  [ $? = 1 ]
                then
                        # Encerrando script com falha caso nao consiga montar a unidade
                        exit 1
                fi

        fi
}


verificar_montar_unidade
/usr/bin/rsync -azh $DIRETORIO_ORIGEM $DIRETORIO_DESTINO
