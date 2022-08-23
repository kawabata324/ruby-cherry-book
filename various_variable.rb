# class Product
#   @name = 'Product'
#
#   def self.name
#     @name
#   end
#
#   def initialize(name)
#     @name = name
#   end
#
#   def name
#     @name
#   end
# end
#
#
# class DVD < Product
#   @name = 'DVD'
#
#   def self.name
#     @name
#   end
#
#   def upcase_name
#     @name.upcase
#   end
# end
#
# puts Product.name
# puts DVD.name
# # => Product
# # DVD
#
# product = Product.new('great product')
# puts product.name
# # => great product
#
# great_dvd = DVD.new('great dvd')
# puts great_dvd.name
# puts great_dvd.upcase_name
# => great dvd
# GREAT DVD



# class Product
#   @@name = 'Product'
#
#   def self.name
#     @@name
#   end
#
#   def initialize(name)
#     @@name = name
#   end
#
#   def name
#     @@name
#   end
# end
#
# class DVD < Product
#   @@name = 'DVD'
#
#   def self.name
#     @@name
#   end
#
#   def upcase_name
#     @@name.upcase
#   end
# end
#
# # DVDが定義されたタイミングでDVDに@@nameが変更される
# puts Product.name
# # => DVD
# puts DVD.name
# # => DVD
#
# product = Product.new('great product')
# puts product.name
# # => great product
# puts DVD.name
# # => great product
#
# DVD1 = DVD.new('great dvd')
# puts DVD1.name
# # => great dvd
# puts product.name
# # => great dvd


# $program_name = 'Awesome program'
#
# class Program
#   def initialize(name)
#     $program_name = name
#   end
#
#   def self.name
#     $program_name
#   end
#
#   def name
#     $program_name
#   end
# end
#
# puts $program_name
# puts Program.name
# # => Awesome program
# # Awesome program
#
# program = Program.new('great program')
# puts program.name
# # => great program
# puts $program_name
# # => great program