### この章の例題：シンボルをキーとしたする場合のハッシュの記法の変換プログラミング

* どちらも有効な記法なのでどちらを使っても問題はない、だが、ソースコード上ではどちらかに統一したほうがいい


条件1: => を使う記法で書いた文字列を変換メソッドに渡すと、：をつける記法に戻る

条件2: {:apple=> "りんご", :orange => 'オレンジ'  }前後のスペースがばらばらでも動作する

```ruby
old_syntax = <<TEXT
{
 :name => 'Alice',
:age=> 23,
 :gender: :female
}
TEXT

hash_short_syntax = convert_hash_syntax(old_syntax)

puts hash_short_syntax
# {
#  name: 'Alice',
#  age: 23,
#  gender: :female
# }

```


## 正規表現って何?

* 正規表現とは文字列の集合を一つも文字列で表現する方法の一つ
* パターンを指定して文字列を効率よく検索/置換するためのミニ言語
* 英語でregular expression
* Regexpクラスはこの英語に由来する
