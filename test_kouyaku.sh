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

# kouyaku.sh が実行可能であることを確認
chmod +x kouyaku.sh

# テストを実行
test_gcd 48 18 6
test_gcd 101 10 1
test_gcd 56 98 14

# 無効な入力に対するテスト
if ./kouyaku.sh 48 a 2>/dev/null; then
    echo "Test failed: expected error for invalid input '48 a'"
    exit 1
else
    echo "Test passed: correctly handled invalid input '48 a'"
fi

if ./kouyaku.sh 48 0 2>/dev/null; then
    echo "Test failed: expected error for invalid input '48 0'"
    exit 1
else
    echo "Test passed: correctly handled invalid input '48 0'"
fi

echo "All tests passed."


