# currencies = { japan: 'yen', us: 'dollar' }
# p currencies.keys

# => [:japan, :us]

# countries = { Japan: '日本', Chinese: '中国', American: 'アメリカ' }
# p countries.values

# => ["日本", "中国", "アメリカ"]

# user1 = { name: '田中', age: 21, country: '日本' }
# puts user1.has_key?(:name)
# # => true
# puts user1.has_key?(:job)
# # => false

# asia_currencies = { china: '元', japan: '円' }
#
# currencies = { italy: 'ユーロ', us: 'dollar', **asia_currencies }
#
# p currencies
# => {:italy=>"ユーロ", :us=>"dollar", :china=>"元", :japan=>"円"}

# asia_currencies = { china: '元', japan: '円' }
# currencies = { italy: 'ユーロ', us: 'dollar' }.merge(asia_currencies)
#
# p currencies
# => {:italy=>"ユーロ", :us=>"dollar", :china=>"元", :japan=>"円"}

# def sum(first:, second:, **others)
#   p first + second
#   p **others
# end
#
# sum(first: 1, second: 2, third: 3, four: 4)
# => 3
# => {:third=>3, :four=>4}

# def sum(first:, second:, **others)
#   p first + second
#   p **others
# end
#
# three_and_four = { third: 3, four: 4 }
# ## Ruby2.0 ~ 2.7までは次のようにハッシュをそのまま渡すと自動的に展開されて渡されていた
# # sum(first: 1, second: 2, three_and_four)
#
# # =>  syntax error, unexpected ')', expecting =>
# # ...: 1, second: 2, three_and_four)
#
# ## 3.0以降では ** を使って展開させる必要がある
# sum(first: 1, second: 2, **three_and_four)
#
# # => 3
# # {:third=>3, :four=>4}

# def buy_burger(burger, options = {})
#   p options
# end
#
# buy_burger('hamburger', side_menu: 'potato', drink: 'cola')
# => {:side_menu=>"potato", :drink=>"cola"}

# a = [1, isShow: true, provider: :google]
# p a
# => [1, {:isShow=>true, :provider=>:google}]

# p { a : 1, b : 2 }
# =>  syntax error, unexpected ':', expecting '}'

# p({ a: 1, b: 2 })
# => {:a=>1, :b=>2}

# currencies = {japan: 'yen', us: 'dollar'}
# p currencies.to_a
# => [[:japan, "yen"], [:us, "dollar"]]

# currencies = [[:japan, "yen"], [:us, "dollar"]]
# p currencies.to_h
# => {:japan=>"yen", :us=>"dollar"}

# array = [1, 2, 3]
# puts array.to_h
# =>　 `to_h': wrong element type Integer at 0 (expected array) (TypeError)

# arry = [[:japan, "yen"], [:japan, "円"]]
# p arry.to_h
# => {:japan=>"円"}

# h = {}
# pp h[:foo]
# # => nil

# # 存在しないキーを指定するとhelloを返す
# h = Hash.new() { 'hello' }
# pp h[:foo]
# # => hello
# # このときHashは空のまま
# pp h
# => {}

# ブロック引数として第一引数にハッシュ本体、第二引数に呼び出しもとで呼び出したキーが入ってる。
# それらを使って登録している
# h = Hash.new { |hash, key| hash[key] = 'hello' }
# p h[:foo]
# p h

# => "hello"
# {:foo=>"hello"}

# 呼び出し時に存在しないキーを指定した場合はデフォルト値であるhelloが設定され
# 元のハッシュに組み込まれている