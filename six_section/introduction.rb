# text = <<TEXT
# I love Ruby
# Python is a great language
# Java and Javascript are different
# TEXT
#
# p text.scan(/[A-Z][A-Za-z]+/)

# => ["Ruby", "Python", "Java", "Javascript"]


text = <<TEXT
私の郵便番号は1234567です。
僕の住所は6770056 兵庫県西脇市板波町1234です。
電話番号は03-1234-5678
TEXT

# puts text.gsub(/(\d{3})(\d{4})/) {"#{$1}-#{$2}"}
# 私の郵便番号は123-4567です。
# 僕の住所は677-0056 兵庫県西脇市板波町1234です。


p text.scan /\d\d-\d\d\d\d-\d\d\d\d/
# => ["03-1234-5678"]