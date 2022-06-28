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

# a = 'abcde'
# #　3文字目を取得する
# p a[2]
# # 2文字目から3文字取得する
# p a[1, 3]
# # 最初の文字を取得する
# p a[-1]
#
# # 一文字目をXに置き換える
# a[0] = 'X'
# p a
# # 2文字目から3文字分をYにする
# a[1, 3] = 'Y'
# p a
# # 末尾に"PRG"を連結する
# a << "PRG"
# p a

# 入れ子になった配列
# records = [
#   [2021],
#   [2019, 5],
#   [2017, 11, 25]
# ]
#
# require 'date'
#
# changed_to_date = records.map do |record|
#   case record.length
#   when 1
#     # 配列で指定された年の1月1日を返す(2021年1月1日)
#     y = record[0]
#     Date.new(y, 1, 1)
#   when 2
#     # 配列で指定された年と月の1日を返す(2019年5月1日)
#     y, m = record[0], record[1]
#     Date.new(y, m, 1)
#   when 3
#     #年と月と日を指定(2017年11月25日)
#     y, m, d = record[0], record[1], record[2]
#     Date.new(y, m, d)
#   end
# end
#
# pp changed_to_date

# records = [
#   [2021],
#   [2019, 5],
#   [2017, 11, 25]
# ]
#
# require 'date'
#
# changed_to_date_list = records.map do |record|
#   case record
#   in [y]
#     Date.new(y, 1, 1)
#   in [y, m]
#     Date.new(y, m, 1)
#   in [y, m, d]
#     Date.new(y, m, d)
#   end
# end
#
# pp changed_to_date_list

# cars = [
#   # psとは馬力のこと
#   { name: 'The Beatle', engine: '105ps' },
#   # エンジンは燃料を燃やして動力を発生させる。モーターは電力によって動力を得る。
#   { name: 'Prius', engine: '98ps', motor: '72ps' },
#   { name: 'Tesla', motor: '306ps' }
# ]

# cars.each do |car|
#   if car.has_key?(:engine) && car.has_key?(:motor)
#     puts "Hybrid: #{car[:name]} / engine: #{car[:engine]} / motor: #{car[:motor]}"
#   elsif car.has_key?(:engine)
#     puts "Gasoline: #{car[:name]} / engine: #{car[:engine]}"
#   elsif car.has_key?(:motor)
#     puts "EV: #{car[:name]} / motor: #{car[:motor]}"
#   end
# end

# cars = [
#   # psとは馬力のこと
#   { name: 'The Beatle', engine: '105ps' },
#   # エンジンは燃料を燃やして動力を発生させる。モーターは電力によって動力を得る。
#   { name: 'Prius', engine: '98ps', motor: '72ps' },
#   { name: 'Tesla', motor: '306ps' }
# ]
#
# cars.each do |car|
#   case car
#   in { name:, engine:, motor: }
#     puts "Hybrid: #{name} / engine: #{engine} / motor: #{motor}"
#   in { name:, engine: }
#     puts "Gasoline: #{name} / engine: #{engine}"
#   in { name:, motor: }
#     puts "EV: #{name} / motor: #{motor}"
#   end
# end

# country = 'india'
#
# greeting =
#   case country
#   in 'japan'
#     'こんにちは'
#   in 'us'
#     'Hello'
#   in 'italy' then 'Ciao'
#   #valiableパターンを用いて任意のオブジェクトをマッチさせる(実質的else節)
#   in obj
#     "Unknown #{obj}"
#   end
#
# pp greeting

# in節でクラス名を書く

# value = 123
#
# case value
# in Integer
#   puts '整数です'
# in String
#   puts '文字列です'
# end
#
# age = 18
# case age
# in 0...18
#   puts '未成年です'
# in 18...122
#   puts '成人しています'
# else
#   puts 'ギネスを超えています'
# end
#

# case [1, 2, 3]
# in obj
#   puts "obj: #{obj}"
# end

# case [1, 2, 3]
# in [fi, se, th]
#   puts "要素は #{fi} #{se} #{th}"
# end

# alice = 'Alice'
# bob = 'Bob'
#
# name = 'Bob'
#
# case name
# in ^alice
#   puts 'Aliceさん、こんにちは!'
# in ^bob
#   puts 'Bobさん、こんにちは!'
# end

# slot_results = [
#   [7, 7, 7],
#   [5, 7, 7],
#   [1, 1, 1],
#   [3, 3, 1]
# ]
#
# slot_results.each do |slot|
#   case slot
#     # 要素数が3つかつ3つとも同じ値であればマッチする
#   in [n, ^n, ^n]
#     puts "当たり"
#   else
#     puts "ハズレ"
#   end
# end

# records = [
#   [Integer, 1, 2],
#   [Integer, 3, 'X']
# ]
#
# records.each do |record|
#   case record
#   in [klass, ^klass, ^klass]
#     puts "配列の要素は全て#{klass}"
#   else
#     puts "配列の要素は全て整数オブジェクトではない"
#   end
# end

# @n = 1
# case 1
# in ^@n
#   '1です'
# end

# @s = '1'
#
# case 1
# in ^(@s.to_i)
#   '1です'
# end

# case [1, [2, 3]]
# in [fi, [se, th]]
#   puts "#{fi} #{se} #{th}"
# end
#
# case [1, [2, 3]]
# in [a, b]
#   puts "#{a} #{b}"
# end

# case [7, 7, 7]
# in [7, 7, 7]
#   puts '大当たり'
# in [n, ^n, ^n]
#   puts '当たり'
# else
#   puts 'ハズレ'
# end

# case ['Alice', 2132, 3]
# in [_n, _n, n]
#   puts "n= #{n}"
# end

# case [1, 2, 3, 34, 4, 4343, 5, 35, 10]
# in [1, *rest, 10]
#   puts "#{rest}"
# end

case [1, 2, 3]
in a, b, c
  puts "#{a}#{b}#{c}"
end
