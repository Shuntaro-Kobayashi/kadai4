#!/bin/bash

#引数が２つであることをチェック
chkArgumentCount(){
	if [ $# != 2 ]; then
        echo "引数の個数が正しくありません"
        exit 1
    else
        return 0
    fi
}

#数字チェック
chkNum(){
	if expr "$1" : "^[0-9]" >/dev/null 2>&1; then
		return 0
	else
		echo  "入力値が数字ではありません"
		exit 1
	fi
}

#2つの数が共に0でないかチェック
chkZero(){
	if [ $1 -eq 0 ] && [ $2 -eq 0 ]; then
		echo  "入力された数字が共に0です"
		exit 1
	else
		return 0
	fi
}

gcd(){
    #第1引数のが大きい場合は、第2引数と入れ替える
    if [ $1 -gt $2 ]; then
		set -- "$2" "$1"
	fi

    #ユークリッドの互除法で最大公約数を求める
	while [ ! 0 -eq "$2" ]; do
		set -- "$2" "`expr "$1" % "$2"`"
	done
	echo "$1"
}

chkArgumentCount $@
chkNum $1
chkNum $2
chkZero $1 $2
gcd $1 $2
