# p :apple.class
# # => Symbol
#
# p :apple.object_id
# p :apple.object_id
# # => 1045468
# # 1045468
#
# p :apple.upcase!
# # => in `<main>': undefined method `upcase!' for :apple:Symbol

# currencies = { :japan => 'yen', :us => 'dollar' }
# p currencies[:japan]
# 文字列より高速
# => "yen"

# タスクの状態をシンボルで管理する
status = :done

case status
when :todo
  p 'これからやる'
when :doing
  p '今やっています'
when :done
  p 'もう終わりました'
end

# => "もう終わりました"