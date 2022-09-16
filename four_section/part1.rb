# # 配列とは複数のデータをまとめて格納できるオブジェクトのことです。
# # 配列内のデータは順番に並んでいて、添字（Index)を指定することでデータを取り出せる
# # 配列は[],を使って作成します（配列リテラル）
#
# # 配列はArrayクラスのオブジェクトです
# puts [].class
# # => Array
#
# #存在しない要素を指定したとしてもエラーにはならずnilを返します
# a = [1, 2, 3]
# p a[100]
# # => nil
#
# #もと配列の要素数よりも大きい数を指定して代入するとその間の要素はnilになります
# # また代入した際はその要素を戻り値として返します
# b = [1, 2, 3]
# p b[10] = 11
# p b
#
# # => 11
# # => [1, 2, 3, nil, nil, nil, nil, nil, nil, nil, 11]
#
# # <<　を指定すると最後に要素を追加することができます
# a = [1]
# a << 2
# p a

# => [1,2]

# 配列の特定の位置にある要素を削除したい際はdelete_atメソッドを使います
# a = [1, 2, 3]
# a.delete_at(0)
# p a
#
# # => [2,3]
#
# # 配列を使った多重代入
# # 右辺が少ない場合はnilが入る
# a, b, c = [1, 2]
# p a
# p b
# p c

# => 1
# => 2
# => nil

# 左辺が多い場合ははみ出した値は切り捨て
# a, b = [1, 10, 100]
# p a
# p b
#
# # => 1
# # => 10
#
# # 配列の多重代入の有効的に使える例
# # divmod
# # 割り算の商と余りを配列として返す
# # 下記だと 14 / 3の 商と余りを配列として返している
#
# p 14.divmod(3)
# # => [4,2]
#
# quotient, remainder = 14.divmod(3)
# # こうして別々の変数に入れたほうが使いやすい
# p quotient
# p remainder

# 4
# 2

# puts "\e[31mABC\e[0m"

# モジュールの用途
#　継承を使わずにクラスに対して共有の特異メソッドを追加する
# クラス名や定数名の衝突を防ぐために名前空間を作る
# 関数的メソッドを定義する
# シングルトンオブジェクトのように扱って設定値を保持する

# モジュールの定義

# module モジュール名
#  # モジュール定義（メソッド定義など）
# end

# helloメソッドをもつGreetAbleモジュール定義

# module GreetAble
#   def hello
#     'hello'
#   end
# end

# クラスとの相違
# モジュールからインスタンスを作成できない
# 他のモジュールやクラスを継承することはできない

# モジュールが何の役にたつのかわからない
# モジュールを利用したメソッド定義
# include exclude

# Rubyでは単一継承
# 従って一つのクラスには一つのスーパークラスしか持てない

# class Product
#   def title
#     log 'title is called'
#     log 'A great movie'
#   end
#
#   private
#     def log(text)
#       puts "[LOG] #{text}"
#     end
# end
#
# class User
#   def name
#     log "name is called"
#     log "Alice"
#   end
#
#   private
#     def log(text)
#       puts "[LOG] #{text}"
#     end
# end

# product = Product.new
# product.title
# # => [LOG] title is called
# # [LOG] A great movie
# user = User.new
# user.name
# => [LOG] name is called
# [LOG] Alice

# ログを出力する private_methodは重複しています。
# しかし、このように重複しているからといって継承の使用は避けるべき

# 継承はつかないがログを出力するという共通の機能は持たせたい。そんな時に選択肢として上がるのがモジュールです
# モジュールにログ出力用のメソッドを定義し、クラスでそのモジュールをincludeするとモジュールで定義したメソッドがインスタンスメソッドとして呼び出せるようになる

# ログ出力用のメソッドを定義するモジュール
# module Loggable
#   private
#     def log(text)
#       puts "[LOG] #{text}"
#     end
# end
#
# class Product
#   include Loggable
#
#   def title
#     log 'title is called'
#     log 'A great movie'
#   end
# end
#
# class User
#   include Loggable
#
#   def name
#     log "name is called"
#     log "Alice"
#   end
# end
#
# product = Product.new
# product.title
#
# user = User.new
# user.name

# このようにモジュールをクラスにincludeすることで
# 継承関係に気にすることなく機能を追加することに成功しました
# このようにincludeして機能を追加することをmixinと言います
# mixin先は基本的にどのようなクラスでもOKです
# このようにRubyはmixinを利用することで多重継承ににた仕組みを実現しています

# include先のmoduleを使うモジュール


# module Taggable
#   def price_tag
#     # price methodは既にinclude先で定義されているはずという前提
#     puts "#{self.price}円"
#   end
# end
#
# class Product
#   include Taggable
#
#   def price
#     1000
#   end
# end
#
# product = Product.new
#
# product.price_tag
# => 1000円


# moduleをextendする

module Loggable
  def log(text)
    puts "[LOG]#{text}"
  end
end

class Product
  # Loggableモジュールをクラスメソッドとして追加する

  extend Loggable

  def self.create_product(names)
    log('create_product is called')
  end

  # log methodをクラスの直下で呼び出すことも可能

  log ("Define Product Class")
end

# クラスメソッド経由でlog methodが呼ばれる
Product.create_product([])
# => [LOG]create_product is called

# privateにしていないので直接呼び出すことも可能

Product.log("Hello")
#=> [LOG]Hello



# includeやextendはクラスの外でも呼び出すことが可能
# Product.include Loggable
# Product.extend Loggable

# 例題：　rainbow methodの作成

# rainbow methodは　特定のクラスだけでなくさまざまなクラスで呼び出せるようにする必要がある

# Rainbowableという名前でmoduleを作成して、それをincludeする？
# String.include Rainbowable
# Array.include Rainbowable
# class String
#  include Rainbowable
# end