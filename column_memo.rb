limit = 100
limit ||= 10
puts limit

# TwitterAPIからアカウント情報を取得して
# アイコン画像のURLやUserの住んでいる地域を返す架空のコードです


# class User
#   # 省略
#
#   def icon_url
#     twitter_data[:icon_url]
#   end
#
#   def location
#     twitter_data[:location]
#   end
#
#   def twitter_data
#     # インスタンス変数と || = を使ったメモ化
#     @twitter_data ||= begin
#     # ここにTwitter APIからデータを取得する処理をかく
#     #
#
#                       end
#   end
# end
#

# 遅延初期化を使わない場合
# class Foo
#   attr_reader :bar
#
#   # この場合、newするたびに重たい処理が実行される
#   def initialize(bar)
#     @bar =
#     # 何か重たい処理を＠barで初期化
#   end
# end
#
# # 遅延初期化を使う場合
# class Foo
#   attr_reader :bar
#   def initialize
#   end
#
#   # barメソッドを呼ばない限り、重たい初期化処理を防げる。
#   def bar
#     @bar ||=
#     # 何か重たい処理を＠barで初期化
#   end
# end