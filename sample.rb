# def greet(*names)
#   p "#{names.join('と')}、こんにちは!"
# end
#
# greet('田中さん')
# greet('田中さん', '佐藤さん')
# greet('田中さん', '佐藤さん', '鈴木さん')

# p ['あ'].join('ー')

# def foo(a, *b, c, d)
#   p "a=#{a}, b=#{b}, c=#{c}, d=#{d}"
# end
#
# foo(1, 2, 3, 4, 5)

# a = [1, 2, 3]
# # []のなかにそのまま配列に置くと、入れ子になった配列（ネストした配列）になる
# p [a]
# # []のなかに*付きで配列に置くと、展開されて配列になる
# p [*a]

# a = [1, 2]
# p [0, *a, 3, 4]

# []で文字列を作成する
# p ['orange', 'melon', 'apple']
# #%wで文字列を作成する(!で囲む場合)
# p %w!orange melon apple!
# #%wで文字列を作成する(()で囲む場合)
# p %w(orange melon apple)
# # スペースや改行が連続した場合も一つの区切り文字として認識される
# p %w(
#   orange
#   melon
#   apple
# )
# # 値に対してスペースを含めたいケースはバックスラッシュでエスケープする必要がある
# p %w(big\ orange melon small\ apple)
# #式展開や\nなどの改行文字を含めたい場合は%Wを使う
# prefix = "This is"
# p %W(#{prefix}\ big\ orange melon small\napple)

# p 'Ruby'.chars
#
# p 'Ruby Java Python'.split

# # a = []と同じ
# p a = Array.new
#
# # 引数を一つ渡すと、その引数文の個数のようそがnilで追加される
# p a = Array.new(5)
#
# # 引数二つ目でnil以外のデフォルト値を入れることができる
# p a = Array.new(5, 0)
#
# # ブロックを使ってデフォルト値を設定する
# # expect [1, 2, 3, 1, 2, 3]
# p a = Array.new(6) { |n| n % 3 + 1 }

# # 要素が5つで'default'がデフォルト値の配列を作成する
# a = Array.new(5, 'default')
# p a
# # 1番目の要素に対して破壊的な変更を加える
# str = a[0]
# str.upcase!
# # 配列全ての要素が変更される
# p a

# a = Array.new(5) do
#   'default'
# end
# p a
# # 1番目の要素に対して破壊的な変更を加える
# str = a[0]
# str.upcase!
# # 配列全ての要素が変更される
# p a

# a = 'abc'.freeze
# a.upcase!

a = 'abcde'
#　3文字目を取得する
p a[2]
# 2文字目から3文字取得する
p a[1, 3]
# 最初の文字を取得する
p a[-1]

# 一文字目をXに置き換える
a[0] = 'X'
p a
# 2文字目から3文字分をYにする
a[1, 3] = 'Y'
p a
# 末尾に"PRG"を連結する
a << "PRG"
p a
