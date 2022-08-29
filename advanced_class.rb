# class People
#   def hello
#     'Hello!'
#   end
#
#   alias greet hello
# end
#
# people1 = People.new
# puts people1.hello
# puts people1.greet

#=> Hello!
# Hello!


# class Product
#   # Objectクラスで定義されている freezeメソッドを削除する
#   undef freeze
# end
#
# product = Product.new
# product.freeze
# => `<main>': undefined method `freeze' for #<Product:0x000000015a0f29a8> (NoMethodError)

# class Product
#   class HighGrade
#     attr_reader :brand
#
#     def initialize(brand)
#       @brand = brand
#     end
#   end
# end


#
# chanel = Product::HighGrade.new('chanel')
#
# puts chanel.brand
# # => chanel


# class Foo
#   class Bar
#     def initialize
#     end
#   end
#
#   private_constant :Bar
# end
#
# Foo::Bar.new
# => <main>': private constant Foo::Bar referenced (NameError)
#


# class User
#   def name=(value)
#     @name = name
#   end
# end
#
# user1 = User.new
# user.name = 'Alice'

# class Product
#   attr_reader :code, :name
#
#   def initialize(code, name)
#     @code = code
#     @name = name
#   end
#
#   def ==(other)
#     # Productで作られたインスタンス　かつ　コードと名前が同じならtrueを返す
#     other.instance_of?(Product) && @code == other.code && @name == other.name
#   end
#
#   def equal?(other)
#     other.instance_of?(Product) && @code == other.code && @name == other.name
#   end
# end
#
# a = Product.new('A-0001', 'A Great Movie')
# b = Product.new('B-0001', 'A Great Book')
# c = Product.new('A-0001', 'A Great Movie')
#
# # 本来であれば　object_id が一致しないので falseが入るが、
# # 再定義しているため　trueが帰る
# puts a == c
#
# # 少し奇妙なコードだが、.(ドット)付きで呼び出してもOK
# puts a.equal?(c)

# puts 1 == 1.0
#=> true


# puts 1.eql?(1.0)
# => false

# 世界の国コードを表す
# class CountryCode
#   attr_reader :code
#
#   def initialize(code)
#     @code = code.hash
#   end
#
#   def eql?(other)
#     other.instance_of?(CountryCode) && @code.eql?(other.code)
#   end
# end
#
# japan = CountryCode.new('JP')
# us = CountryCode.new('US')
# india = CountryCode.new('IN')
#
# # インスタンスをキーにしてハッシュを作成する
# CURRENCIES = { japan => 'yen', us => 'dollar', india =>  'rupee'}
# key = CountryCode.new('JP')
# puts CURRENCIES[key]
# # => nil
# puts CURRENCIES[japan]
# # => yen