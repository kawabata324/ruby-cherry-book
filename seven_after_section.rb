# Rubyにはインスタンス自身を表すselfキーワードがあります
# JavaやC#の経験者であれば, thisキーワードとほぼ同じものと考えて構いません
# メソッドの内部では他のメソッドを呼び出す場合は暗黙的にselfに対してメソッドを呼び出している
# そのためselfは省略可能ですが、明示的にselfをつけてメソッドを呼び出しても構わない
# 以下はselfなしでnameメソッドを呼び出す場合と、self付きで呼び出す場合、それに加えて直接インスタンス変数を参照する場合の３パターンで@nameの内容を参照している
#
#

# class User
#   attr_accessor :name
#
#   def initialize(name)
#     @name = name
#   end
#
#   def hello
#     # selfなしでnameメソッドを呼ぶ
#     puts "Hello, I am #{name}"
#   end
#
#   def hi
#     # self付きでnameメソッドを呼ぶ
#     puts "Hello, I am #{self.name}"
#   end
#
#   def my_name
#     # 直接インスタンス変数の@nameにアクセスする
#     puts "My name is #{@name}"
#   end
# end
#
# user = User.new('Alice')
# user.hello
# user.hi
# user.my_name

# 上のコードではご覧の通り,nameもself.nameも＠nameも同じ文字列"Alice"を返します。
# この場合はどれも同じ結果になるのでこれが正解と一つを選ぶことはできません
# selfをつけたり、つけなかったりそのままインスタンス変数にアクセスしたり、人によって書き方が異なる
#
#
#
# 7.5.1 selfのつけ忘れで不具合が発生するケース
#
# name= の場合は話が異なる

# class User
#   attr_accessor :name
#
#   def initialize(name)
#     @name = name
#   end
#
#   def rename_to_bob
#     # selfなしでname= メソッドを呼ぶ(?)
#     # ローカル変数に文字列を代入したように見えるため失敗する
#     name = 'Bob'
#   end
#
#   def rename_to_carol
#     # self付きでname=　メソッドを呼ぶ
#     self.name = 'Carol'
#   end
#
#   def rename_to_dave
#     # インスタンス変数を書き換える
#     @name = 'Dave'
#   end
# end
#
# user = User.new('Alice')
#
# user.rename_to_bob
# puts user.name
#
# user.rename_to_carol
# puts user.name
#
# user.rename_to_dave
# puts user.name
#
#
#
# 7.5.2 クラスメソッドの内部やクラス構文直下のself
#
# クラス定義ないに登場するselfは場所によってそのクラスのインスタンス自身を表したり、
# クラス自身を表したりします。
#
#
# class Foo
#   # 注意このputsはクラス定義の読み込み時に呼び出される
#   puts "クラス直下のself: #{self}"
#
#   def self.bar
#     puts "クラスメソッド内のself: #{self}"
#   end
#
#   def baz
#     puts "インスタンスメソッド内のself: #{self}"
#   end
# end
#
# Foo.bar
# foo = Foo.new
# foo.baz
#

# class Foo
#   # 注意このputsはクラス定義の読み込み時に呼び出される
#   puts "クラス直下のself: #{self}"
#
#   def self.bar
#     puts "クラスメソッド内のself: #{self}"
#     # クラスメソッドからインスタンスメソッドのbazを呼び出す
#     self.baz
#   end
#
#   def baz
#     puts "インスタンスメソッド内のself: #{self}"
#     # インスタンスメソッドからクラスメソッドのbarを呼び出す
#     self.bar
#   end
# end
#
# Foo.bar
# foo = Foo.new
# foo.baz

# このようなものはerrorになる
# ただクラス構文の直下とクラスメソッドはselfがどちらもクラス地震になるので呼び出すことは可能
#
# 他のプログラミング言語の経験者からするとクラス構文の直下で直接クラスメソッドが呼び出せるということ
# 自体に驚くかもしれません。しかしRubyの場合、クラス定義自体も上から順番に実行されるプログラミングになっているので
# クラス構文お直下でクラスメソッドを呼び出せる
# 極端な例だがクラス構文の直下に繰り返し処理を書いても実行可能
#

# class Foo
#   # クラス定義が読み込まれたタイミングでHello!を３回出力する
#   3.times do
#     puts "Hello!"
#   end
# end

# クラスメソッドをインスタンスメソッドの内部から呼びさす場合は次のように書きます
# クラス名.メソッド名
# 以下はインスタンスメソッドからクラスメソッドを呼び出すコード例
#
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  #金額を整形するクラスメソッド
  def self.format_price(price)
    "#{price}円"
  end

  def to_s
    # インスタンスメソッドからクラスメソッドを呼び出す
    # formatted_price = Product.format_price(price)
    # このようにもかける
    formatted_price = self.class.format_price(price)
    "name: #{name}, price: #{formatted_price}"
  end
end

product = Product.new('A great movie', 1000)
puts product.to_s