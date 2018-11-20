#!/bin/sh

echo "START SCRIPT"

_build()
{
  echo "build"
}

_start()
{
  echo "start"
}

_stoprm()
{
  echo "stoprm"
}

_test()
{
   echo "test"
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




