# クラスの作成の仕方を学ぶ

# Rubyはオブジェクト指向言語で、これまでStringクラスやArrayクラスなどさまざまなクラスを使ってきました。
# しかし、クラスは使うだけでなく作ることも可能
# この章では自分のクラスを作る方法を説明していく

# 7-1-1
# この章の例題
# 改札機プログラム
#
#
# 改札機の機能
#
# 表 7-1
#
# 梅田
# 160  十三
# 190 　160　三国
#
#
# 3つの駅と運賃が決められている
#
# 改札機を通るためにはまず切符を購入する
# 購入可能な切符は160円と190円のみ
# 切符は入場時と出場時に改札機を通します
# 運賃が足りていれば出場できますが、不足している場合は出場できません
#
#
# テストシナリオ
#
# シナリオ１(1区間)
# 160円の切符を購入する
# 梅田で入場し十三で出場する
# 出場できる
#
# シナリオ２(2区間　運賃不足)
# 160円の切符を購入する
# 梅田で入場し、三国で出る
# 出場できない
#
# シナリオ３(2区間　運賃ちょうど)
# 190円の切符を購入する
# 梅田で入場し、三国で出る
# 出場できる
#
# シナリオ４(梅田以外の駅から乗車する)
# 160の切符を購入する
# 十三で入場し三国で出場する
# 出場できる
#
#
#
# 改札機プログラムの実行例
#
# 改札機オブジェクトの作成
# umeda = Gate.new(:umeda)
# mikuni = Gate.new(:mikuni)
#
# 160円の切符を購入して梅田で入場し三国で降りる
# ticket = Ticket.new(160)
# umeda.enter(ticket)
# mikuni.exit(ticket) => false
#
# 190円の切符を購入して梅田で入場し三国で降りる
# ticket = Ticket.new(190)
# umeda.enter(ticket)
# mikuni.exit(ticket) => true
#
#
#
#
# 7-12 この章で学ぶこと
#
# オブジェクト指向プログラミングの基礎
# クラスの定義
# selfキーワード
# クラスの継承
# メソッドの可視性
# 定数
# さまざまな種類の変数
# クラス定義やRubyの言語仕様に関する高度な話題
#
#
# 7-2　オブジェクト指向プログラミングの基礎知識
# 7-2-1
# クラスを使う場合と使わない場合
#
# クラスを使うプログラミングと使わないプログラミング
#
# userをあらわすデータをプログラム上で処理したい。ユーザはデータとして氏名(first_name last_name) 年齢を持ちます
# ハッシュと配列を使って
#
# users = []
# users << { first_name: 'Alice', last_name: 'Ruby', age: 20 }
# users << { first_name: 'Bob', last_name: 'Python', age: 30 }
#
# # 氏名を作成するメソッド
# def full_name(user)
#   "#{user[:first_name]} #{user[:last_name]}"
# end
#
# # userのデータを表示する
# users.each do |user|
#   puts "氏名：#{full_name(user)}, 年齢：#{user[:age]}"
# end
#
# # ハッシュを使った場合キーをタイプミスするとnilが返ってくる。間違ったキーを指定してもエラーにならない
# # nilが返ってきて不具合に気づきにくい
# pp users[0][:first_mame]
#
# # ハッシュは新しくキーを追加できたり、内容を簡単い変更できる脆くて壊れやすいプログラムになりがち
# # 勝手に新しいキーを追加する
# users[0][:country] = 'japan'
# # 勝手にfirst_nameを変更
# users[0][:first_name] = 'Carol'
# # ハッシュが変更される
# pp users[0]

# ここで示している小さなプログラムであれば問題ないかもしれない
# 大きなプログラムになれば、ハッシュで管理できなくなってくる
# そこで登場するのがクラスこういう場合はUserクラスという新しいデータ型を作りそこに入れた方がより堅牢なプログラムになる
#
# Userクラスを定義する
#

# ユーザのデータを作成する
# users = []
# users << User.new('Alice', 'Ruby', 20)
# users << User.new('Bob', 'Python', 30)
#
# # userのデータを表示する
# users.each do |user|
#   puts "氏名：#{user.full_name}, 年齢：#{user.age}"
# end

# タイプミスした時にエラーが走るので気づきやすい
# users[0].first_mane
# 新しく属性を追加できない
# users[0].country = 'japan'
# 勝手にfirst_nameを書き換える
# users[0].first_name = 'Carol'
#
# クラスはこのように、内部にデータを保持しさらに自分が保持しているデータを利用する独自のメソッドを持つことだできます
# データとそのデータに関するメソッドが常にセットになるのでクラスを使わない場合に比べてデータとメソッドの整理がしやすくなります
# このサンプルプログラムは小さなプログラムのためそこまでメリットが見えないのかもしれないですが、プログラムが大規模になればなるほど
# データとメソッドを一緒に持ち運べるクラスのメリットが大きくなってきます

# 7.2.2 オブジェクト指向プログラム関連の用語
#
# クラス
# オブジェクト
# インスタンス
# レシーバ
# メソッド
# メッセージ
# 状態（state)
# 属性(attribute property)

# クラス
# クラスはデータ型の一種。「オブジェクトの設計図」とか「オブジェクトの雛形」と呼ばれたりすることもあります
# Rubyではオブジェクトは何らかのクラスに属しています。クラスが同じであれば保持している属性（データ項目）や使えるメソッドは原則として同じになります
#
# オブジェクト、インスタンス、レシーバ
# クラスはあくまで設計図なので、設計図だけ持っていても仕方ありません。車の設計図から赤い車や黒い車が作られるのと同じように
# オブジェクト指向プログラムではクラスからさまざまなオブジェクトが作成できます
# 同じクラスから作られたオブジェクトは同じ属性、やメソッドを持ちますが、属性の中に保持されるデータ（名前、数値、色）などはオブジェクトによって異なります
#
#
# class User
#   attr_reader :first_name, :last_name, :age
#
#   def initialize(first_name, last_name, age)
#     @first_name = first_name
#     @last_name = last_name
#     @age = age
#   end
#
#   # 氏名を作成するメソッド
#   # クラス内部に定義することで引数を渡す必要がなくなる
#   def full_name
#     "#{first_name} #{last_name}"
#   end
# end
#
# # Alice Rubyさん　2０歳というユーザのオブジェクトを作成する
# alice = User.new('Alice', 'Ruby', 20)
#
# # Bob Pythonさん 30歳というユーザのオブジェクトを作成する
# bob = User.new('Bob', 'Python', 30)
#
# #どちらもfull_messageメソッドを持つが保持しているデータが異なるため戻り値は異なる
#
# pp alice.full_name
#
# pp bob.full_name
#
# # このようにクラスを元に作られたデータの塊をオブジェクトと呼びます。場合によってはオブジェクトではインスタンスと呼びます。以下の文章は同じであると考えて問題ありません
# # これはUserクラスのオブジェクトです
# # これはuserクラスのインスタンスです
# #
# # またメソッドの関係を説明する場合はオブジェクトのことをレシーバと呼ぶこともよくあります
# # 以下のようなサンプルコードがあるとします
# user = User.new('Alice', 'Ruby', 20)
# user.first_name
# # このコードは以下のように説明される場合があります
# # 2行目でUserオブジェクトのfirst_nameメソッドを呼び出している
# # ここでfist_nameメソッドのレシーバはuserです
# # レシーバは英語で書くとreceiverで受け取る人や受信者という意味です
# # なのでレシーバはメソッドを呼び出された側というニュアンスをよく出したい時によく使われます
# #
# # プログラムのことをプログラムと呼んだり、コードと呼んだり、ソースコードと呼んだりするようにオブジェクトもさまざまな呼ばれ方をします
# # 文脈によってはオブジェクトと呼ばないと違和感があったり、用語の定義にこだわる人はオブジェクトとインスタンスは違う。と怒ったりするかもしれない。
# # プログラマの日常的な会話ではオブジェクトやインスタンスやレシーバといった用語がプログラマ個人の好みや文脈の中で使い分けられています。
#
# #　メソッド、メッセージ
# # オブジェクトが持つ動作や振る舞いをメソッドと呼ぶ、オブジェクトの動作とか振る舞いと呼ぶとすごく難しく感じつかもしれない。
# # 要するに何らかの処理をひとまとめにして名前をつけ何度も利用できるようにしたのがメソッドです
# # 他のプログラミング経験者であれば関数やサブルーチンをイメージしてもらえればOK
# user = User.new('Alice', 'Ruby', 20)
# user.first_name

# このコードはレシーバとメッセージという用語を使って説明される場合があります。
# 2行目ではuserというレシーバに対してfirst_messageというメッセージを送っている

# レシーバとメッセージという呼び方はsmall talkというオブジェクト指向言語でよく使われる呼び方です。
# Rubyもsmall talkの影響を受けている部分があるので、時々レシーバとメッセージという用語が使われる場合があります
#
# 状態（state)
# オブジェクトごとに保持されるデータのことをオブジェクトの状態（もしくはstate)と呼ぶことがあります。例えば信号機オブジェクトの現在の状態は赤です
# といった感じです Userクラスが持つ名前や年齢といったデータもオブジェクト指向の考え方でいくとUserの状態に含まれます
#
# 属性(attribute property)
# オブジェクトの状態（オブジェクト内の各データ）は外部から取得したり変更したりできる場合があります
# 例えば以下のコードではuserのネームを外部から取得したり変更したりしています

# class User
#   attr_accessor :first_name
#
#   def initialize(first_name)
#     @first_name = first_name
#   end
# end
#
# user = User.new('Alice')
#
# pp user.first_name
# # first_nameを変更する
# user.first_name = 'ありす'
# pp user.first_name

# このようにオブジェクトから取得（もしくはオブジェクトに設定）できる値のことを属性（もしくはアトリビュートやプロパティ）と呼びます
# 多くの場合、属性の名前は名詞になっています
#
#
# 7.3 クラスの定義
#
# Rubyのクラスを定義する場合は次のような構文を使います
# class クラスめい
# end
#
# クラス名は必ず大文字ではじめます。小文字で始めると構文エラーになります。慣習としてキャメルケースで書くのが一般的です
#
# 7.3.1 オブジェクトの作成とinitializeメソッド
# クラスからオブジェクトを作成する場合は以下のようにnewメソッドを使います
# User.new

# この時に呼ばれるのがinitializeメソッドです。インスタンスを初期化するために実行したい処理があればこのinitializeメソッドに処理を実装します
# 特に必要なければ実装する必要はありません
# 他のプログラミング経験者であればコンストラクタのようなものだと考えるとわかりやすいです
# 次のようにするとnewメソッドを呼び出した時にinitializeメソッドが呼ばれていることがわかります

# class User
#
#   def initialize
#     puts 'Initialized'
#   end
# end
#
#
# User.new
# # initializeメソッドは特需なメソッドでデフォルトでprivateメソッドになっているため外部から呼び出すことはできません
# user = User.new
# user.initialize
#
#
# initializeメソッドに引数をつけるとnewで呼び出す時も必要になる

# class User
#
#   def initialize(name, age)
#     puts "name: #{name} age: #{age}"
#   end
# end
#
# # User.new
# User.new('Alice', 20)

# 7.3.2　インスタンスメソッドの定義
# クラス内部でメソッドを定義するとそのメソッドはインスタンスメソッドとなります
# インスタンスメソッドとはその名の通りそのクラスのインスタンスに対して呼び出すことができるメソッド

# class User
#   def hello
#     "Hello"
#   end
# end
#
# user = User.new
# pp user.hello

# 7.3.3 インスタンス変数とアクセサメソッド
# クラスの内部ではインスタンス変数を使うことができます
# インスタンス変数とは同じインスタンス　同じオブジェクトの内部で共有される変数
# Rubyでは@から始まる変数がインスタンス変数です。

# class User
#   def initialize(name)
#     @name = name
#   end
#
#   def hello
#     "Hello, I am #{@name}"
#   end
# end
#
# user = User.new('Alice')
# puts user.hello

# @、＠＠や$といったプレフィックス（接頭辞）がつかない変数はローカル変数となります。
# ちなみに、＠＠はクラス変数の$はグローバル変数のプレフィックス　
# アルファベットの大文字で始まる識別子は定数と見做される
# メソッドやブロックの内部で宣言されたローカル変数のスコープはその変数が宣言された位置から自分の宣言されたメソッドまたはブロックの終わりまで
# メソッドやブロックが繰り返し呼ばれるとその都度ローカル変数が作られます
#

# class User
#   def initialize(name)
#     @name = name
#   end
#
#   def hello
#     # shuffled_name はローカル変数
#     shuffled_name = @name.chars.shuffle.join
#     puts "Hello I am #{shuffled_name}"
#   end
# end
#
# user = User.new('Alice')
# user.hello

# ローカル変数は参照する前に必ず=で値を代入して作成する必要がある。
# まだ作成されていないローカル変数を参照しようとするとエラーになる

# class User
#   def initialize(name)
#     @name = name
#   end
#
#   def hello
#     # shuffled_name はローカル変数
#     #　わざとローカル変数への代入をコメントアウト
#     # shuffled_name = @name.chars.shuffle.join
#     puts "Hello I am #{shuffled_name}"
#   end
# end
#
# user = User.new('Alice')
# # Error
# user.hello
#
#
# 一方でインスタンス変数は作成（値を代入）する前にいきなり参照してもエラーにならない
# nilが返る
# class User
#   def initialize(name)
#     # わざとインスタンス変数をコメントアウトする
#     # @name = name
#   end
#
#   def hello
#     # インスタンス変数を参照する
#     p "Hello I am #{@name}"
#   end
# end
#
# user = User.new('Alice')
# user.hello

# インスタンス変数をタイプミスすると思いがけない不具合につながる

# class User
#   def initialize(name)
#     @name = name
#   end
#
#   def hello
#     puts "Hello I am #{@mane}"
#   end
# end
#
#
# user = User.new('Alice')
# user.hello

# インスタンス変数をクラスの外部から参照するできません。もし、参照したい場合は参照用のメソッドを作る必要があります
#

# class User
#   def initialize(name)
#     @name = name
#   end
#
#   # @nameを外部から参照するためのメソッド
#   def name
#     @name
#   end
# end
#
# user = User.new('Alice')
# # nameメソッドを経由して@nameの内容を取得する
# puts user.name

# インスタンス変数の内容を外部から変更したい場合も変更用のメソッドを定義します
# 他の言語経験者は驚くかもしれませんが、Rubyは=で終わるメソッドで定義すると、変数に代入するような方式でそのメソッドを呼び出すことができます
#

# class User
#   def initialize(name)
#     @name = name
#   end
#
#   # @nameを外部から参照するためのメソッド
#   def name
#     @name
#   end
#
#   # @nameを外部から変更するためのメソッド
#   def name=(value)
#     @name = value
#   end
# end
#
# user = User.new('Alice')
# # 変数に代入しているように見えるが実際にはname=メソッドを呼び出している
# user.name = 'Bob'
# puts user.name

# nameメソッドのように値を読みだすメソッドのことを[getterメソッド]
# name=メソッドのように値を書き込むメソッドのことを[setterメソッド]
# 他の言語ではget_ set_といった接頭辞がつくことがありますがRubyでは稀です
# また、ゲッターメソッドとセッターメソッドを総称してアクセサメソッドと呼びます
#
# Rubyの場合、単純にインスタンス変数の内容を外部から書き込みするのであれば attr_accessorというメソッド
# を使って退屈なアクセスメソッドの定義を省略できる

# class User
#   attr_accessor :name
#   def initialize(name)
#     @name = name
#   end
# end
#
# user = User.new('Alice')
# # 変数に代入しているように見えるが実際にはname=メソッドを呼び出している
# user.name = 'Bob'
# puts user.name
#
# インスタンスを読み取り専用にするにはattr_accessorの代わりにattr_readerメソッドを使います

# class User
#   #　読み取り戦勝のメソッドを定義する
#   attr_reader :name
#
#   def initialize(name)
#     @name = name
#   end
# end
#
# user = User.new('Alice')
# # @nameの参照はできる
# puts user.name
# # @nameを書き換えようとするとエラ-
# user.name = 'Bob'

# 逆に書き込み専用にするにはattr_writerを使う

# class User
#   attr_writer :name
#   def initialize(name)
#     @name = name
#   end
# end
#
# user = User.new('Alice')
# # 変数に代入しているように見えるが実際にはname=メソッドを呼び出している
# user.name = 'Bob'
# # @nameの参照はできない
# puts user.name
#
#
# カンマを使って複数のインスタンス変数に対するアクセサリメソッドを定義する

# class User
#   attr_accessor :name, :age
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end
#
# user = User.new('Alice',20)
# # 変数に代入しているように見えるが実際にはname=メソッドを呼び出している
# puts user.name
# user.age = 30
#
#
# 7.3.4 クラスメソッドの定義
#
# インスタンスメソッドの定義の項で説明した通り、クラス構文の内部で単純にメソッドを定義すると
# そのメソッドはインスタンスメソッドになります。インスタンスメソッドはそのクラスのインスタンスに対して呼び出すことのできるメソッド
# インスタンスに不l組まれるデータを読み書きする場合はインスタンスメソッドを定義します
#
#
# class User
#   def initialize(name)
#     @name = name
#   end
#
#   #インスタンスメソッド
#   def hello
#     # @nameの値はインスタンスによって異なる
#     puts "Hello, I am #{@name}"
#   end
# end
#
# alice = User.new('Alice')
# # インスタンスメソッドはインスタンス（オブジェクト）に対して呼び出す
# alice.hello
#
# bob = User.new('Bob')
# # インスタンスによって内部のデータが異なるので、helloメソッドの結果も異なる
# bob.hello

# 一方そのクラスに関連の深いものの、一つ一つのインスタンスに含まれるデータは使わないメソッドを定義したい場合もあります
# そのような場合はクラスメソッドを定義した方が使い勝手がよくなります
# クラスメソッドを定義する方法の一つは以下のようにメソッドの前にself.をつけることです

# クラスメソッドを定義するその１
# class クラス名
#  def self.クラスメソッド
#  # クラスメソッドの処理
#  end
# end
#
# もう一つは次のようにclass << self　から endの間にメソッドを書く方法
#
# クラスメソッドを定義するその２
# class クラス名
#  class << self
#   def クラスメソッド
#   #　クラスメソッドの処理
#   end
#  end
# end
#
#
#
# 後者の方法は入れ子が１段階深くなりますが、その代わりにクラスメソッドをたくさん定義したい場合はメソッドの名の
# 前に毎回self.をつけなくてもすみます。取りたでも構わない。本書では前者を主に使う
#
# クラスメソッドを呼び出す場合は以下のようにクラス名の直後にドットをつけてメソッドを呼び出します
# クラス名.メソッド名
#
# 名前の配列を渡すとUserクラスのインスタンスを配列に入れて返す create_usersメソッド
#

class User
  def initialize(name)
    @name = name
  end

  def self.create_users(names)
    names.map do |name|
      User.new(name)
    end
  end

  def hello
    puts "Hello, I am #{@name}"
  end
end

names = %w[Alice Bob Carol]
users = User.create_users(names)

users.each do |user|
  user.hello
end

# ところでこの項ではUser.crate_usersのようなメソッドをクラスメソッドと呼びましたが、このような
# メソッドは厳密にいうとクラスオブジェクトの特異メソッドを定義していることになります。
# 特異メソッドについては7.10.8　クラスメソッドは特異メソッドの一種の頃で詳しく説明します
#
# メソッド名の表記法について
#
# Rubyではインスタンスメソッドを表す場合にクラス名#メソッド名
# クラスメソッドを表す場合にクラス名.メソッド名　または　クラス名::メソッド名と書きます
#
#
#