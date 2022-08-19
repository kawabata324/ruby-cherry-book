# 7.2 オブジェクト指向のプログラミングの基礎知識
#
#
# クラスを使うプログラミングとクラスを使わないプログラミングの違い

# クラスを使わない Hashと配列を使用する(脆くて壊れやすいプログラミング)
#
# 1. Usersのデータを作成する
# users = []
# users << { first_name: 'Kawabata', last_name: 'Haruki', age: 22 }
# users << { first_name: 'Suiyoubino', last_name: 'kanpanera', age: 24}
#
# 2. 氏名を作るメソッド
# def full_name(user)
#   "#{user[:first_name]} #{user[:last_name]}"
# end
#
# 2. Usersのデータを表示する
# users.map do |user|
#   puts "氏名: #{full_name(user)}、年齢: #{user[:age]}"
# end
#
# => 氏名: Kawabata Haruki、年齢: 22
# 氏名: Suiyoubino kanpanera、年齢: 24
#
# 問題点
#
# 1.ハッシュを使うとキーをタイプミスした際に気づかない
# 2.タイプしたとしても、エラーにならずnilが帰ってくるので不具合に気づきにくい
#
# user[ages]に変えたとしたわかりやすかった
#
# 3.ハッシュは新しくキーを作ることができる
#
# 最初のユーザに対して新たにCountryというキーと値をsetする
# users[0][:country] = 'Japan'
# puts users[0]
# => {:first_name=>"Kawabata", :last_name=>"Haruki", :age=>22, :country=>"Japan"}
#
#
# 4. 簡単に内容を変更できる
#
# 最初のuserの年齢を100歳ににしてみる
# users[0][:age] = 100
# puts users[0]
# => {:first_name=>"Kawabata", :last_name=>"Haruki", :age=>100 }
#
# 3.4のことを踏まえるとハッシュは脆くて壊れやすいプログラミングだと言える



# 　クラスを使ったプログラミング[クラスと配列を使用する](堅牢なプログラミングになりやすい)
#
#
# 1.Userクラスを定義

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
# # 2.ユーザのデータを作成する
# users = []
# users << User.new('Kawabata', 'Haruki', 22)
# users << User.new('Suiyoubino', 'Kanpanera', 24)
#
# # 3.ユーザのデータを表示する
# users.each do |user|
#   puts "氏名: #{user.full_name}、年齢: #{user.age}"
# end

# 戻り値
# => 氏名: Kawabata Haruki、年齢: 22
# 氏名: Suiyoubino Kanpanera、年齢: 24
#


# 問題点の解決
#
# 1.タイプミスしたケースでも気づける
# 2.nilではなくエラーが帰ってくる
#
# puts users[0].ages
# => `<main>': undefined method `ages' for #<User:0x000000012d85e138 @first_name="Kawabata", @last_name="Haruki", @age=22> (NoMethodError)
# Did you mean?  age

# 3.クラスの場合は新しく属性（データ項目)と値を追加できない
# users[0].counrty = 'Japan'
# puts users[0]
# => `<main>': undefined method `counrty=' for #<User:0x00000001529240e8 @first_name="Kawabata", @last_name="Haruki", @age=22> (NoMethodError)
#
#
# 4. 勝手に内容を変更できないようにすることもできる
# users[0].age = 100
# puts users[0]
# => in `<main>': undefined method `age=' for #<User:0x000000015984be08 @first_name="Kawabata", @last_name="Haruki", @age=22> (NoMethodError)
#
#
# クラスはこのように内部にデータを保持し、さらに自分が保持しているデータを利用する独自のメソッドを持てる
# データとそのデータに関するメソッドが常にセットになるのでクラスを使わない場合に比べてデータとメソッドの整理がしやすい
#
#

