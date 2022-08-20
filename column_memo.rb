# limit = 100
# limit ||= 10
# puts limit

# TwitterAPIからアカウント情報を取得して
# アイコン画像のURLやUserの住んでいる地域を返す架空のコードです


# class User
#   # 省略
#
#   def icon_url
#     twitter_data[:icon_url]
#   end
#
#   def location
#     twitter_data[:location]
#   end
#
#   def twitter_data
#     # インスタンス変数と || = を使ったメモ化
#     @twitter_data ||= begin
#     # ここにTwitter APIからデータを取得する処理をかく
#     #
#
#                       end
#   end
# end
#

# 遅延初期化を使わない場合
# class Foo
#   attr_reader :bar
#
#   # この場合、newするたびに重たい処理が実行される
#   def initialize(bar)
#     @bar =
#     # 何か重たい処理を＠barで初期化
#   end
# end
#
# # 遅延初期化を使う場合
# class Foo
#   attr_reader :bar
#   def initialize
#   end
#
#   # barメソッドを呼ばない限り、重たい初期化処理を防げる。
#   def bar
#     @bar ||=
#     # 何か重たい処理を＠barで初期化
#   end
# end
#
#



# class User
#   attr_reader :name
#
#   def initialize(name)
#     @name = name
#   end
#
#   def hello
#     "Hello, I am #{name}"
#   end
#
#   def hi
#     "Hi, I am #{self.name}"
#   end
#
#   def my_name
#     "My name is #{@name}"
#   end
# end
#
# user1 = User.new('Kawabata')
# puts user1.hello
# puts user1.hi
# puts user1.my_name


# class User
#   attr_accessor :name
#
#   def initialize(name)
#     @name = name
#   end
#
#   def rename_to_Alice
#     name = 'Alice'
#   end
#
#   def rename_to_Bob
#     self.name = 'Bob'
#   end
#
#   def rename_to_Jack
#     @name = 'Jack'
#   end
# end
#
# kawabata = User.new('Kawabata')
# kawabata.rename_to_Alice
# puts kawabata.name
#
# kawabata.rename_to_Bob
# puts kawabata.name
#
# kawabata.rename_to_Jack
# puts kawabata.name
#
#

# class Foo
#   puts "クラス構文直下のself: #{self}"
#
#   def self.bar
#     puts "クラスメソッド内部のself: #{self}"
#   end
#
#   def baz
#     puts "インスタンスメソッドの内部のself: #{self}"
#   end
#
#   def initialize
#     puts "initialize内部のself: #{self}"
#   end
# end
# # クラスメソッド
# Foo.bar
# # initialize
# foo = Foo.new
# # インスタンスメソッド
# foo.baz

# => クラス構文直下のself: Foo
# クラスメソッド内部のself: Foo
# initialize内部のself: #<Foo:0x000000011f85b8b0>
# インスタンスメソッドの内部のself: #<Foo:0x000000011f85b8b0>
#
#
#

# class Foo
#   def self.three_repeat_hello
#     3.times do
#       puts 'Hello!'
#     end
#   end
#
#   self.three_repeat_hello
# end

# => Hello!
# Hello!
# Hello!
#
#

class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def self.price_format(price)
    "#{price}円"
  end

  def describe_product
    puts "name: #{@name} price: #{self.class.price_format(@price)}"
  end
end



product1 = Product.new('nice movie', 1300)
product1.describe_product

# => name: nice movie price: 1300円