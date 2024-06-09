#!/bin/bash

# テスト関数
test_gcd() {
    local num1=$1
    local num2=$2
    local expected=$3

    local result=$(./kouyaku.sh $num1 $num2)
    if [ "$result" -ne "$expected" ]; then
        echo "Test failed: gcd($num1, $num2) = $result, expected $expected"
        exit 1
    else
        echo "Test passed: gcd($num1, $num2) = $result"
    fi
}

# 無効な入力に対するテスト
test_invalid_input() {
    local input=$1
    local expected_message=$2

    local result=$(./kouyaku.sh $input 2>&1)
    if [[ "$result" != *"$expected_message"* ]]; then
        echo "Test failed: expected error message '$expected_message' for input '$input'"
        exit 1
    else
        echo "Test passed: correctly handled invalid input '$input'"
    fi
}


# 有効なテスト
test_gcd 48 18 6
test_gcd 101 10 1
test_gcd 56 98 14
test_gcd 2 4 2

# 無効なてすと
test_invalid_input "3" "Usage: ./kouyaku.sh num1 num2"
test_invalid_input "文字 5" "Both arguments must be natural numbers."
test_invalid_input "5 文字" "Both arguments must be natural numbers."

echo "テスト終了"

