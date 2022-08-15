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
# class Product
#   attr_reader :name, :price
#
#   def initialize(name, price)
#     @name = name
#     @price = price
#   end
#
#   #金額を整形するクラスメソッド
#   def self.format_price(price)
#     "#{price}円"
#   end
#
#   def to_s
#     # インスタンスメソッドからクラスメソッドを呼び出す
#     # formatted_price = Product.format_price(price)
#     # このようにもかける
#     formatted_price = self.class.format_price(price)
#     "name: #{name}, price: #{formatted_price}"
#   end
# end
#
# product = Product.new('A great movie', 1000)
# puts product.to_s
#
#
#
# クラスの継承
# オブジェクト指向プログラミングと聞いて真っ先に思い浮かべるのは継承だ。という人もおそらく多い
# まず、クラスの継承に関する用語を簡単に整理する。DVDクラスがProductクラスを継承する時、
# ProductクラスのことをDVDクラスのスーパークラス（または親クラス）と呼びます
# Productクラスから見るとDVDクラスはProductクラスのサブクラスと呼びます
#
# クラス図の多くはスーパークラスを上にサブクラスを下に配置し、サブクラスからスーパークラスへ向かって矢印を伸ばすことで
# サブクラスがスーパークラスを継承していることを表します
# 継承は時々「スーパークラスの機能を全部引き継ぐための仕組み」と誤解される。そのように考えると扱いづらいクラス
# 継承を使いたいと思った時は機能ではなく、性質や概念の共通点に着目してください
# 性質や概念が共通化しているかどうかを判断しり方法は
# サブクラスはスーパークラスの一種である
# と声に出して読んだ時に違和感がないかを確かめることです　これは is-aの関係と呼ばれます。
# 例えば販売管理を行うシステムで、商品クラスがスーパークラス、DVDがサブクラスだった場合
# DVDは商品の一種である DVD is a product
#
# 声に出して読んでも違和感がありません。こういうケースは適切な継承関係である可能性が高いです。
# またサブクラスはスーパークラスの性質に特化したもので反対にスーパークラスはサブクラスの性質を汎化したもの。
# 特化とはより細かく具体的になることで
# 汎化とはより大雑把に抽象化されること
#
#
# DVDと商品を比較した場合、DVDの方が単に商品と呼んだ時よりも性質や概念が具体的になっています。
# 逆に商品はDVDに比べると中身が曖昧で売るための何かということはわかりますが、具体的にいうとそれって何
# とんあてしまう。つまり商品はDVDよりも抽象的な概念になっている。
# 特化と汎化の関係

# 7.6.1 標準ライブラリの継承関係
#
# Rubyの継承は単一継承です。継承できるスーパークラスは一つだけ
# rubyにはミックスインという多重継承ににたきのうを持っています
#
#
# 継承関係の頂点にいるのはBasicObjectクラスです。それをObjectクラスを軽yそうしています。stringクラスやArrayクラスはObjectクラスとis-aの関係にある
# つまりstringはobjectクラスの一種でarrayクラスもobjectクラスの一種
#
# BasicObjectクラスはRuby1.9から導入されたクラスでそれまではObjectクラスが頂点にいました
# ObjectクラスとBasicObjectクラスを区別する必要があるのは特殊な用途に限られるので、通常はObjectクラスが頂点と考えて差し支えない
#
#
#
# 7.6.2 デフォルトで継承されるObjectクラス
#
# 継承元を指定せずに作成したクラスはデフォルトでObjectクラスを継承しています
#

# class User
# end
# # このクラスは何一つ定義していませんが to_s メソッドやnil?　メソッドを呼び出すことができます
# # user = User.new
# # puts user.to_s
# # puts user.nil?
# # puts User.superclass
#
# # このようにするとObjectクラスから継承したメソッドの一覧が確認できる
# # pp user.methods.sort
#
# # 7.6.3 オブジェクトのクラスの確認する
#
# user = User.new
# puts user.class
# # instance_of? メソッドを使っても調べることができます
# #
# # # userはUserクラスのインスタンスかどうか?
# # puts user.instance_of?(User)
# # # userはStringクラスのインスタンスかどうか?
# # puts user.instance_of?(String)
#
# # 継承関係があるかどうかは is_a? kind_of? メソッドを使用する
# puts user.is_a?(Object)
# puts user.kind_of?(BasicObject)
# puts user.is_a?(User)
#
# puts user.is_a?(String)
#
# 7.6.4 他のクラスを継承したクラスを作る
#
# 独自のクラスを定義する際はObjectクラス以外のクラスを継承することもできます
#

class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

# class DVD < Product
#   attr_reader :running_time
#
#   def initialize(name, price, running_time)
#     # superを使うと親クラスの同名メソッドを呼び出すことができる
#     super(name, price)
#     @running_time = running_time
#   end
# end
#
# dvd = DVD.new('A great movie', 1000, 120)
# puts dvd.name
# puts dvd.price
# puts dvd.running_time
#
#
#

# class DVD < Product
#   def initialize(name, price)
#     # superを使うと親クラスの同名メソッドを呼び出すことができる
#     # 引数の数が同じであれば省略できる
#     super
#   end
# end
#
# dvd = DVD.new('A great movie', 1000)
# puts dvd.name
# puts dvd.price
#
#

# class DVD < Product
#   def initialize()
#     # superを使うと親クラスの同名メソッドを呼び出すことができる
#     # 引数の数が同じであれば省略できる
#     # 引数0を示すがこの場合数が合わないのでエラーになる
#     super()
#   end
# end
#
# dvd = DVD.new
# puts dvd.name
# puts dvd.price

# class DVD < Product
#   # サブクラスで特別な処理をしないなら同名メソッドを定義したりsuperを呼んだりする必要はない
#   def initialize(name, price)
#     # superを使うと親クラスの同名メソッドを呼び出すことができる
#     # 引数の数が同じであれば省略できる
#     super
#   end
# end
#
# dvd = DVD.new('A great movie', 1000)
# puts dvd.name
# puts dvd.price

# なおここではinitializeメソッドでsuperを使いましたが他のメソッドでも使える
#
#
#
#
#7.6.6 メソッドのオーバーライド
#
# サブクラスではスーパークラスと同名のメソッド定義することで、スーパークラスの処理を上書きすることができる。
#
# これをメソッドのオーバーライドと言います。
# 先ほど説明したDVDクラスのinitializeメソッドもオーバーライドの一種ですが、ここではinitialize以外のメソッドを使ってオーバーライドの仕組みを説明します
# ここで取り上げるのは, to_sメソッドです。　オブジェクトの内容を文字列にして返すメソッドです。
# このメソッドはObjectクラスで定義されているので、全てのオブジェクトでto_sメソッドを呼び出すことができる
#
#
# class Product
#   attr_reader :name, :price
#
#   def initialize(name, price)
#     @name = name
#     @price = price
#   end
#
#   def to_s
#     "name: #{name}, price: #{price}"
#   end
# end
#
# class DVD < Product
#   attr_reader :running_time
#
#   def initialize(name, price, running_time)
#     super(name,price)
#     @running_time = running_time
#   end
#
#   def to_s
#     "#{super}, running_time: #{running_time}"
#   end
# end
#
# product = Product.new('A great Movie', 1000)
# puts product.to_s
#
# dvd = DVD.new('An awesome film', 3000, 120)
# puts dvd.to_s

# 7.6.7 クラスメソッドの継承
#
# クラスを継承すると、クラスメソッドも継承されます。

# class Foo
#   def self.hello
#     'hello'
#   end
# end
#
# class Bar < Foo
# end
#
# puts Foo.hello
#
# puts Bar.hello
#
#
# 引数名がつかない *や **
#
# gem(外部ライブラリ)のソーズコードを見ていると、次のように引数が(*)だけのメソッド定義を見かけることがあります

# class DVD < Product
#   def initialize(*)
#     # 省略
#   end
# end

#
# * は可変町引数を表す記号です([4.7.7 メソッドの可変町引数の項を参照])
# 普通は *argsのように引数名をつけるはずですが、ここではあえて省略しています。
#
# 意図１　
# メソッドないでsuperキーワードが使われていた場合は、このメソッドでは引数は使わないが、superメソッド（スーパークラスのメソッド）で必要になるので渡された引数をそのままsuperメソッドに渡すという意味
#

# class Product
#   def initialize(name, price)
#     puts "name: #{name}, price: #{price}"
#   end
# end
#
# class DVD < Product
#   # initialize(name, price)としてもいいがこのメソッドでは引数を使わないので
#   # 可変長引数として一旦任意の引数を受け取り、それをそのままsuperメソッドに渡す
#   def initialize(...)
#     super
#     #その他の処理
#   end
# end
#
# DVD.new('A great movie', 1000)
#
#
# 意図２
# 引数のない * や ** があっても、メソッド内でsuperキーワードが使われていない場合は、「余分に渡された引数を無視する)という意味
#
#

# def add(a, b, *)
#   puts a + b
# end
#
# # 最初に渡された二つの引数のみを使い、他の引数は無視する
# add(1,2,3,5,6)
#
# # name以外のキーワード引数は無視する
# def greet(name:, **)
#   puts "Hello! #{name}"
# end
#
# greet(name: 'Alice', friend: 'Bob')

# メソッドの可視性
#
# Ruby メソッドには以下のような3つの可視性がある
#
#
# public
# protected
# private
#
#
# 7.7.1 public メソッド
#
# public メソッドはクラスの外部からでも自由に呼び出せるメソッド
# initializeメソッド以外のインスタンスメソッドはデフォルトでpublicメソッドになります

# class User
#   # デフォルトはpublicメソッド
#   def hello
#     puts 'Hello!'
#   end
# end
# user = User.new
# # public メソッドなのでクラスの外部から呼び出せる
# user.hello