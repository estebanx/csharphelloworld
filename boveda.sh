#!/bin/bash

echo $0
docker login -u $1 -p $2 $3

declare -a arr=("acrhumanointermediary.azurecr.io/bovedadatos/paymentprofile-api" 
                "acrhumanointermediary.azurecr.io/bovedadatos/authentication-api" 
                "acrhumanointermediary.azurecr.io/bovedadatos/client-api" 
                "acrhumanointermediary.azurecr.io/bovedadatos/purchase-api" 
                "acrhumanointermediary.azurecr.io/bovedadatos/role-api"
                "acrhumanointermediary.azurecr.io/bovedadatos/backofficeclien-api" 
                "acrhumanointermediary.azurecr.io/bovedadatos/domiciliation-api" 
                "acrhumanointermediary.azurecr.io/bovedadatos/bulkpurchase-api"
                "acrhumanointermediary.azurecr.io/bovedadatos/bulkclient-api" 
                "acrhumanointermediary.azurecr.io/bovedadatos/clientpolicy-api" 
                "acrhumanointermediary.azurecr.io/bovedadatos/clientinfo-api" 
                "acrhumanointermediary.azurecr.io/bovedadatos/documenttype-api")

declare -a arrport=('1708' '1700' '1703' '1709' '1710' '1711' '1707' '1702' '1701' '1705' '1704' '1706')
index=0
sum=1

for i in %${arr[@]}%
do
     docker stop $(docker ps -q --filter ancestor=$i:$4)
     docker rm $(docker ps -q --filter ancestor=$i:$4)
     docker rmi $i:$4
     docker pull $i:$4
     docker run -d -p ${arrport[$index]}:80 $i:$4
    ((index += sum))
done
