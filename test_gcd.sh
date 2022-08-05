#!/bin/bash

ERROR_EXIT () {
    echo "$1" >&2 
	rm -f $tmp
	exit 1
}

# テストパターン
# 引数が2つの自然数で第1引数の方が小さい場合
./gcd.sh 2 4 > /tmp/$$-result
echo "2" > /tmp/$$-anser
diff /tmp/$$-result /tmp/$$-anser || ERROR_EXIT "引数が2つの自然数で第1引数の方が小さい場合でエラーです"

# 引数が2つの自然数で第2引数の方が小さい場合
./gcd.sh 15 5 > /tmp/$$-result
echo "5" > /tmp/$$-anser
diff /tmp/$$-result /tmp/$$-anser || ERROR_EXIT "引数が2つの自然数で第2引数の方が小さい場合でエラーです"

# 引数が2つとも0の場合
./gcd.sh 0 0 > /tmp/$$-result
echo "入力された数字が共に0です" > /tmp/$$-anser
diff /tmp/$$-result /tmp/$$-anser || ERROR_EXIT "引数が2つとも0の場合でエラーです"

# 引数がない場合
./gcd.sh > /tmp/$$-result
echo "引数の個数が正しくありません" > /tmp/$$-anser
diff /tmp/$$-result /tmp/$$-anser || ERROR_EXIT "引数がない場合でエラーです"

# 引数が1つの場合
./gcd.sh 1 > /tmp/$$-result
echo "引数の個数が正しくありません" > /tmp/$$-anser
diff /tmp/$$-result /tmp/$$-anser || ERROR_EXIT "引数が1つの場合でエラーです"

# 引数が3つの場合
./gcd.sh 3 6 9 > /tmp/$$-result
echo "引数の個数が正しくありません" > /tmp/$$-anser
diff /tmp/$$-result /tmp/$$-anser || ERROR_EXIT "引数が3つの場合でエラーです"

# 引数が文字列の場合
./gcd.sh > /tmp/$$-result
echo "入力値が数字ではありません" > /tmp/$$-anser
diff /tmp/$$-result /tmp/$$-anser || ERROR_EXIT "引数が文字列の場合でエラーです"


echo "テストクリアしました"
rm -f $tmp
