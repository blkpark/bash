#!/bin/bash

read -sp 'Enter password. ' PASS; echo
export PASS

for file in *.p12 *.cer
do
	if [ ! -e "$file" ]
	then
    	echo "${file##*.} 파일이 없습니다."
    	continue
	else
    	if [ "${file##*.}" == "cer" ]
    	then
    		openssl x509 -inform der -in $file -out ${file%.*}.pem
    		echo ”\'${file%.*}.pem\' 파일이 생성되었습니다.”
    	else
    		openssl pkcs12 -in $file -out ${file%.*}.pem -nodes -password pass:$PASS
			echo ”\'${file%.*}.pem\' 파일이 생성되었습니다.”
    	fi
   	fi
done
echo "done"

exit 0