# class User
# end
#
# user1 = User.new
# puts user1.to_s
# puts user1.nil?
#
# puts User.superclass
#
# puts User.superclass.methods.sort
#
#

# 7.6.3
#
#
# class User
#
# end
#
# user1 = User.new
# puts user1.class
# # => User
#

# class User
# end
#
# user1 = User.new
# puts user1.instance_of?(User)
# => true
#
#

# class User
# end
#
# user1 = User.new
# puts user1.is_a?(Object)
# puts user1.is_a?(BasicObject)
# puts user1.is_a?(User)
#=> true
# true
# true
#
#

# class Product
# end
#
# class DVD < Product
# end
#
# puts DVD.superclass
#=> Product
#
#

# class Product
#   attr_reader :name, :price
#
#   def initialize(name, price)
#     @name = name
#     @price = price
#   end
# end
#
# class DVD < Product
#   # DVD特有の属性
#   attr_reader :running_time
#
#   def initialize(name, price, running_time)
#     super(name, price)
#     @running_time = running_time
#   end
# end
#
# one_piece = DVD.new('OnePiece',3625,120)
#
# puts one_piece.name
# puts one_piece.price
# puts one_piece.running_time

# => OnePiece
# 3625
# 120
#

# class Product
#   attr_reader :name, :price
#
#   def initialize(name, price)
#     @name = name
#     @price = price
#   end
# end
#
# class Production < Product
#   def initialize(name, price)
#     super
#   end
# end
#
# mac_book = Production.new('MacBook',100000)
# puts mac_book.name
# puts mac_book.price
#=> MacBook
# 100000
#

# class User
#   attr_reader :first_name, :last_name
#
#   def initialize(first_name, last_name)
#     @first_name = first_name
#     @last_name = last_name
#   end
#
#   def hello
#     "Hello, #{@first_name} #{@last_name}"
#   end
# end
#
#
# class SpecialUser < User
#   attr_reader :rank
#
#   def initialize(first_name, last_name, rank)
#     super(first_name, last_name)
#     @rank = rank
#   end
#
#   def hello
#     "#{super}様 あなたのランクは #{@rank}でございます。"
#   end
# end
#
# user1 = User.new('田中', '太郎')
# puts user1.hello
#
# special_user1 = SpecialUser.new('鈴木', '一郎', 'S')
# puts special_user1.hello

# => Hello, 田中 太郎
# Hello, 鈴木 一郎様 あなたのランクは Sでございます。
#
#


class User
  def self.hello
    puts "Hello"
  end
end

class ActiveUser < User
end

User.hello
ActiveUser.hello
# => Hello
# Hello