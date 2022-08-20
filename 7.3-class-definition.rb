# クラスの定義
#

class JugemuJugemuGogonoSurikireKaijaniSuigyono
end

# 7.3.1
# オブジェクトの作成とイニシャライズメソッド
#
#
#
# class User
#   def initialize
#     puts 'initializeが呼ばれた!!!!!!!!!!!'
#   end
# end

# user1 = User.new
# 戻り値
# => initializeが呼ばれた!!!!!!!!!!!
#
#

# class User
#   def initialize
#     puts 'initializeが呼ばれた!!!!!!!!!!!'
#   end
# end
#
# user1 = User.new
# user1.initialize

# 戻り値
# => initializeが呼ばれた!!!!!!!!!!!
# 7.3-class-definition.rb:32:in `<main>': private method `initialize' called for #<User:0x000000011f94f7f8> (NoMethodError)

# userのinitializeに対して　name ageを受け取るようにする
# class User
#   def initialize(name, age)
#     puts "name: #{name}, age: #{age}"
#   end
# end

# user1 = User.new
# 戻り値
# => `initialize': wrong number of arguments (given 0, expected 2) (ArgumentError)
#
#
# user2 = User.new('Kawabata', 22)
# puts user2
#
#
# class User
#   # インスタンスメソッドの定義
#   def hello
#     "Hello"
#   end
# end
#
# user1 = User.new
# puts user1.hello
# 戻り値
# => Hello
#
#
#
#
#
# class User
#   def initialize(name)
#     #インスタンス作成時に的された名前をインスタンス変数に保存する
#     @name = name
#   end
#
#   def hello
#     number = 1
#     "Hello, I am #{@name} #{number}"
#   end
#
#   def test
#     number
#   end
# end
# #
# user1 = User.new('Kawabata')
# puts user1.hello
# puts user1.test
# # 戻り値
# # => Hello, I am Kawabata 1
# 7.3-class-definition.rb:81:in `test': undefined local variable or method `number' for #<User:0x000000011f9552e8 @name="Kawabata"> (NameError)
#
#

# class User
#   def initialize(name)
#   end
#
#   def hello
#     "Hello, I am #{@name}"
#   end
# end
#
# user1 = User.new('Kawabata')
# p user1.hello
# 戻り値
# => "Hello, I am "

# class User
#   def initialize(name)
#     @name = name
#   end
#
#   def name
#     @name
#   end
# end
#
# user1 = User.new('Kawabata')
# puts user1.name
# # 戻り値
# # => Kawabata
#

# class User
#   def initialize(name)
#     @name = name
#   end
#
#   def name
#     @name
#   end
#
#   def name=(value)
#     @name = value
#   end
# end
#
# user1 = User.new('Kawabata')
# user1.name = '川端'
# puts user1.name
# 戻り値
# => 川端
#
#

# class User
#   attr_accessor :name
#
#   def initialize(name)
#     @name = name
#   end
# end
#
# user1 = User.new('Kawabata')
# user1.name = '川端'
# puts user1.name
# 戻り値
# => 川端
#
#
#
# class User
#   attr_reader :name
#
#   def initialize(name)
#     @name = name
#   end
# end
#
# user1 = User.new('Kawabata')
# user1.name = '川端'
#
#
#
#


# class User
#   attr_writer :name
#
#   def initialize(name)
#     @name = name
#   end
# end
#
# user1 = User.new('Kawabata')
# puts user1.name
#
#

# class User
#   attr_accessor :first_name, :last_name
#   attr_writer :age
#
#   def initialize(first_name, last_name, age)
#     @first_name = first_name
#     @last_name = last_name
#     @age = age
#   end
# end
#
#

# # クラスメソッドを定義する方法その1
#
# class クラス名
#   class << self
#     def クラスメソッド
#       # クラスメソッドの処理
#     end
#   end
# end
#
#
# クラスメソッドを定義する方法その２

# class クラス名
#   def self.クラスメソッド
#     # クラスメソッドの処理
#   end
# end
#
#
# 名前の配列を渡すと、ユーザクラスのインスタンスを配列にして返す create_users　メソッドを定義する
#
# class User
#   attr_accessor :name
#
#   def initialize(name)
#     @name = name
#   end
#
#   def self.create_users(name_list)
#     name_list.map do |name|
#       self.new(name)
#     end
#   end
#
#   def hello
#     "Hi, My name is #{name}"
#   end
# end
#
# users = User.create_users(%w[Kawabata Alice Bob])
#
# users.each do |user|
#   puts user.hello
# end

# 戻り値
# => Hi, My name is Kawabata
# Hi, My name is Alice
# Hi, My name is Bob
#
#


# class Product
#   DEFAULT_PRICE = 0
#
#   attr_reader :name, :price
#
#   def initialize(name, price = DEFAULT_PRICE)
#     @name = name
#     @price = price
#   end
# end
#
#
# apex = Product.new('Apex')
# puts apex.price
#
#
#

# class User
#   attr_accessor :name
# end
#
# user1 = User.new
# user1.name = 'Kawabata'
# puts user1.name