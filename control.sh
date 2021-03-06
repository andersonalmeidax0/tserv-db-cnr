#!/bin/sh

echo "START SCRIPT"

_build()
{
  echo "************************************build"
  sudo docker build  -t="tserv-db-img" -f ./Dockerfile .
  sudo docker tag tserv-db-img andersonalmeidax0/tserv-db-img:v1.0.0
  sudo docker push  andersonalmeidax0/tserv-db-img:v1.0.0
}

_start()
{
  echo "start*****************************"
  sudo docker run -d -p 9999:9999 -v /home/anderson/data/tserv:/data --name tserv-db-cnr  tserv-db-img
}

_stoprm()
{
  echo "stoprm****************************"
  sudo docker stop  tserv-db-cnr
  sudo docker rm  tserv-db-cnr

}

_test()
{
  sudo docker logs tserv-db-cnr
  echo "-----------------"
  response=$(curl -X GET localhost:9999/health);
  echo "RESP:";  echo ${response}
  echo "-----------------"
  if [ "${response}" =  "APPSERV OK" ];
  then
      echo "SUCESS!!!!!!!";
  fi;
}


while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -start)
            _start
            exit
            ;;
        -build)
            _build
            exit
            ;;

        -stoprm)
            _stoprm
            exit
            ;;
        -test)
            _test
            exit
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            exit 1
            ;;
    esac

    shift
done

echo "END SCRIPT"




