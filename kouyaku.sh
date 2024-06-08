#!/bin/bash

# 引数が2つであることを確認
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 num1 num2"
    exit 1
fi

# 引数が自然数であることを確認
if ! [[ "$1" =~ ^[0-9]+$ ]] || ! [[ "$2" =~ ^[0-9]+$ ]]; then
    echo "Both arguments must be natural numbers."
    exit 1
fi

num1=$1
num2=$2

# 最大公約数を計算する関数
gcd() {
    local a=$1
    local b=$2
    while [ $b -ne 0 ]; then
        local temp=$b
        b=$((a % b))
        a=$temp
    done
    echo $a
}

# 最大公約数を計算して表示
gcd $num1 $num2

