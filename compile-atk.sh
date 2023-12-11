#!/bin/env bash
# -eq 是用于数值比较的运算符，而字符串的比较一般使用 =

FILE_NAME=$(basename $0)

if [ "$#" -gt 1 ]; then
	echo " + ${FILE_NAME}: $LINENO"
	echo "Usage:"
	echo "	./${FILE_NAME}"
	echo "		or"
	echo "	./${FILE_NAME} clean"
	exit 1
fi

if [ "$1" = "clean" ]; then
	make -f ./Makefile.sdk clean
else
	make -f ./Makefile.sdk TF_A_DEVICETREE=stm32mp157d-atk-ev1 TF_A_CONFIG=sdcard ELF_DEBUG_ENABLE='1' all
fi
