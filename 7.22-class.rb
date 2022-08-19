# オブジェクト指向プログラミング関連の用語
#
# 1.クラス
# class User
#   attr_reader :first_name, :last_name, :age
#
#   def initialize(first_name, last_name, age)
#     @first_name = first_name
#     @last_name = last_name
#     @age = age
#   end
#
#   def full_name
#     "#{@first_name} #{@last_name}"
#   end
# end
#
#
# alice = User.new('Wonderland', 'Alice', 16)
# kawabata = User.new('Kawabata', 'Haruki', 22)
#
# # どちらもfull_nameメソッドを持つが保持しているデータが異なるので戻り値の結果は異なる
#
# puts alice.full_name
# puts kawabata.full_name

# 戻り値
#　=> Wonderland Alice
# Kawabata Haruki
#
#

# 変更可能なfirst_name属性を持つようなUserクラスを作成する

# class User
#   attr_accessor :first_name
#
#   def initialize(first_name)
#     @first_name = first_name
#   end
# end
#
# kawabata = User.new('Kawabata')
# kawabata.first_name = '川端'
#
# puts kawabata.first_name
# 戻り値
# => 川端