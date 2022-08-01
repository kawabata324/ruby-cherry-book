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

class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename_to_bob
    # selfなしでname= メソッドを呼ぶ(?)
    # ローカル変数に文字列を代入したように見えるため失敗する
    name = 'Bob'
  end

  def rename_to_carol
    # self付きでname=　メソッドを呼ぶ
    self.name = 'Carol'
  end

  def rename_to_dave
    # インスタンス変数を書き換える
    @name = 'Dave'
  end
end

user = User.new('Alice')

user.rename_to_bob
puts user.name

user.rename_to_carol
puts user.name

user.rename_to_dave
puts user.name