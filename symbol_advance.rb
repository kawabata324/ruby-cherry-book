# # シンボルにできないもの
# :12345
# # =>  syntax error, unexpected integer literal, expecting literal content or terminator or tSTRING_DBEG or tSTRING_DVAR
# :ruby-is-fun
# # => `<main>': undefined local variable or method `is' for main:Object (NameError)
# :ruby is fun
# # => : syntax error, unexpected local variable or method, expecting end-of-input
# :()
# # => syntax error, unexpected '(', expecting literal content or terminator or tSTRING_DBEG or tSTRING_DVAR

# %s 区切り文字はなんでもいいが個人的には()にしたい

# p %s(apple)
# p %s(ruby is fun)
#=> :apple
# :"ruby is fun"

# p %i(apple orange grape)
# # => [:apple, :orange, :grape]
# name = 'Alice'
# # 改行文字や式展開を使いたい場合は %I を使用する
# p %I(apple #{name})
# # => [:apple, :Alice]

# string = 'apple'
# symbol = :apple
#
# string == symbol
# # => false
#
# string + symbol
# # =>  `+': no implicit conversion of Symbol into String (TypeError)

# string = 'apple'
# p string.to_sym
# # => :apple

# symbol = :apple
# p symbol.to_s
# # => 'apple'

# 国名に応じて通貨を返す　該当する国keyがなければnilを返す

# def find_currency(country)
#   currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
#   currencies[country]
# end
#
# # 指定された国の通過を大文字にする
# def find_uppercase_currency(country)
#   currency = find_currency(country)
#   # nilの可能性があるためcountryがnilでないことを保証する必要がある
#   # upcaseをnilに呼び出すとこうなる`find_uppercase_currency': undefined method `upcase' for nil:NilClass (NoMethodError)
#   if currency
#   currency.upcase
#   end
# end
#
# p find_uppercase_currency(:china)

# def find_currency(country)
#   currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
#   currencies[country]
# end
#
# # 指定された国の通過を大文字にする
# def find_uppercase_currency(country)
#   # nilの可能性があるためcountryがnilでないことを保証する必要がある
#   # upcaseをnilに呼び出すとこうなる`find_uppercase_currency': undefined method `upcase' for nil:NilClass (NoMethodError)
#   currency = find_currency(country)
#   currency&.upcase
# end
#
# p find_uppercase_currency(:china)

# limit ||= 10
# p limit
# # => 10
#
# limit = 20
# limit ||= 10
# p limit
# => 20

# なおnilだった際に代入させたいものが処理を書く必要がある場合は
# begin end を用いる
#
# limit ||= begin
#             a = 10
#             b = 10
#             a + b
#           end
#
# p limit
# # => 20

# def user_id_exist?
#   # idが2の人を探す
#   user = User.find(2)
#   # userが見つかったらtrue 見つからなかったらfalse
#   if user
#     true
#   else
#     false
#   end
# end

def user_id_exist?
  # idが2の人を探す
  !!User.find(2)
end
