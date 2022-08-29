# class User
#   def hello
#     puts "Hello"
#   end
# end
#
# user1 = User.new
# user1.hello
# => Hello
#

# class User
#
#   def hello
#     puts "Hello! #{self.name}"
#   end
#
#   private
#     def name
#       'Alice'
#     end
# end
#
# user1 = User.new
# user1.hello
# Hello! Alice

# class User
#   private
#
#     def name
#       'Kawabata'
#     end
#
#   public
#
#     def hello
#       puts "Hello, #{self.name}"
#     end
# end
#
# user1 = User.new
# user1.hello
#=> Hello, Kawabata
#
#

# class User
#   private
#     def name
#       "Kawabata"
#     end
# end
#
# class SpecialUser < User
#   def hello
#     puts "Hello, #{self.name}"
#   end
# end
#
# special_user = SpecialUser.new
# special_user.hello
#
#

# class User
#   private
#
#     def name
#       "Kawabata"
#     end
# end
#
# class SpecialUser < User
#   def hello
#     puts "Hello, #{self.name}"
#   end
#
#   def name
#     "Jack"
#   end
# end
#
# user1 = SpecialUser.new
# puts user1.name
#=> Jack
#

# class User
#   private
#
#   def self.hello
#     puts "Hello"
#   end
# end
#
# User.hello
# #=> Hello
#
#
# class User
#
#   class << self
#     private
#       def hello
#         puts "Hello"
#       end
#   end
# end

# User.hello
#=>  private method `hello' called for User:Class (NoMethodError)
#
#

# class User
#   def self.hello
#     puts "Hello"
#   end
#
#   private_class_method :hello
# end

# User.hello
# => private method `hello' called for User:Class (NoMethodError)
#
#

# class Foo
#   def bar
#     'bar'
#   end
#
#   private :bar
# end
#
# foo = Foo.new
# foo.bar
# =>  private method `bar' called for #<Foo:0x0000000120061a78> (NoMethodError)
#
#

# class User
#   private def hello
#     puts "Hello"
#   end
# end
#
# user1 = User.new
# user1.hello
#=>  private method `hello' called for #<User:0x0000000131144df8> (NoMethodError)
#
#
#

# class User
#   private attr_accessor :name, :age
#
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end
#
# user1 = User.new('田中太郎', 32)
# puts user1.name
# =>  private method `name' called for #<User:0x000000014b9373e8 @name="田中太郎", @age=32> (NoMethodError)
#
#

# class User
#   attr_reader :name
#
#   def initialize(name, weight)
#     @name = name
#     @weight = weight
#   end
#
#   # 自分がother_userよりも重い場合は true
#   def heavier_than?(other_user)
#     other_user.weight < @weight
#   end
#
#   protected
#     def weight
#       @weight
#     end
# end
#
# user1 = User.new('Alice', 50)
# user2 = User.new('Kawabata', 60)
# #
# puts user1.heavier_than?(user2)
# # => false
# user1.weight
# => : protected method `weight' called for #<User:0x0000000128048138 @name="Alice", @weight=50> (NoMethodError)
#
#

# class User
#   protected attr_reader :name, :weight
#
#   def initialize(name, weight)
#     @name = name
#     @weight = weight
#   end
#
#   # 自分がother_userよりも重い場合は true
#   def heavier_than?(other_user)
#     other_user.weight < @weight
#   end
# end
#
# user1 = User.new('Alice', 50)
# user2 = User.new('Kawabata', 60)
# #
# puts user1.heavier_than?(user2)
# => false