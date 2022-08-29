# # 空のハッシュを作成し、そのクラス名を確認する
# {}
#
# # キーとハッシュの組み合わせ（要素）を3つ格納する
# {
#   キー１ => 値1,
#   キー２ => 値2,
#   キー３ => 値3
# }

# h = { 'a' => 1 }
# puts h.class
# => Hash

# currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
# puts currencies['india']

# => rupee

# currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
#
# p currencies['brazil']
# => nil

# currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
# currencies.each do |key,value|
#   puts "#{key} : #{value}"
# end

# => japan : yen
# us : dollar
# india : rupee

# currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
# currencies.each do |key_value|
#   # ["キー","値"]
#   # index0番目にキー、index1番目に値が格納された配列
#   p key_value
# end

# => ["japan", "yen"]
# ["us", "dollar"]
# ["india", "rupee"]

# a = { 'x' => 1, 'y' => 2, 'z' => 3 }
# b = { 'z' => 3, 'x' => 1, 'y' => 2 }
# # キーと値の組み合わせが全て同じなら並び順は関係ない
# puts a == b
# # => true

# puts Hash.new.size
# # => 0
# a = { 'x' => 1, 'y' => 2, 'z' => 3 }
# puts a.length
# # => 3

# currencies = { 'japan' => 'yen', 'us' => 'dollar' }
# # 戻り値は削除対象の値になる
# puts currencies.delete('us')
# puts currencies
# # => dollar
# # {"japan"=>"yen"}

# currencies = { 'japan' => 'yen', 'us' => 'dollar' }
# p currencies.delete('brazil')
# p currencies
# => nil
# => {"japan"=>"yen", "us"=>"dollar"}

currencies = { 'japan' => 'yen', 'us' => 'dollar' }
p currencies.delete('brazil') {|key| "Not Found: #{key}"}