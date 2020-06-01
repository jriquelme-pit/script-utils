#!/usr/bin/env bash
echo $BASH_VERSION

FILE=lista

LISTA=$(cat $FILE)
ORIGEN=../disco
DESTINO=../disco2/
INDEX=1

while read line; do

        ORI="${ORIGEN}/${line}"
        DEST=${DESTINO}

        echo "$(date) :: Numero ${INDEX} :: File ${line}">> copia.log
        echo "$(date) :: Copiando #${INDEX} ->  ${ORI} >> ${DEST}">> copia.log

        rsync -avP "${ORI}" ${DEST}
        INDEX=$((INDEX + 1))

done < $FILE
