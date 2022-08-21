# class Product
#   DEFAULT_PRICE = 0
# end
#
# puts Product::DEFAULT_PRICE
# => 0
#
#

# puts GREEN = 0
# => 0
#
#

# class TrafficLight
#   # 配列と各要素を定数として同時に定義する
#   COLORS = [
#     GREEN = 0,
#     YELLOW = 1,
#     RED = 2
#   ]
# end
#
# p TrafficLight::COLORS
# puts TrafficLight::GREEN
# puts TrafficLight::YELLOW
# puts TrafficLight::RED

#=> [0, 1, 2]
# 0
# 1
# 2
#

# class Product
#   DEFAULT_PRICE = 0
#
#   DEFAULT_PRICE = 1000
# end
#
# # => warning: already initialized constant Product::DEFAULT_PRICE
# # warning: previous definition of DEFAULT_PRICE was here
#
# puts Product::DEFAULT_PRICE
# #=> 1000
# #
# Product::DEFAULT_PRICE = 3000
# # => warning: already initialized constant Product::DEFAULT_PRICE
# puts Product::DEFAULT_PRICE
# # => 30000
#
# Product.freeze
# Product::DEFAULT_PRICE = 5000
# # =>  `<main>': can't modify frozen #<Class:Product>: Product (FrozenError)

# class Product
#   DEFAULT_PRICE = 0
#
#   self.freeze
#   DEFAULT_PRICE = 1000
# end
#
# #=>  `<class:Product>': can't modify frozen #<Class:Product>: Product (FrozenError)
#
# class Product
#   DEFAULT_PRICE = 0
#
#   self.freeze
#   def hello
#     puts "Hello"
#   end
# end

#=>  `<class:Product>': can't modify frozen #<Class:Product>: Product (FrozenError)

class Product
  NAME = 'MacBook'.freeze
  SPEC_LIST = ['Air', 'Pro'].map(&:freeze).freeze
  PRICE_LIST = { ヤマダ電機: '10万円', エディオン: '13万円' }.map(&:freeze).freeze
end

# Product::NAME.upcase!
# puts Product::NAME
# #=> `upcase!': can't modify frozen String: "MacBook" (FrozenError)

# Product::SPEC_LIST << 'Error'
# p Product::SPEC_LIST
# #=> `<main>': can't modify frozen Array: ["Air", "Pro"] (FrozenError)

# Product::PRICE_LIST[:悪い電気] = "100000000万"
# p Product::PRICE_LIST
#  `<main>': can't modify frozen Hash: {:ヤマダ電機=>"10万円", :エディオン=>"13万円"} (FrozenError)

Product::SPEC_LIST[0].upcase!
p Product::SPEC_LIST
# => ["AIR", "Pro"]