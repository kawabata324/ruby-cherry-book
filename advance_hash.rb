# currencies = { japan: 'yen', us: 'dollar' }
# puts currencies[:japan]
# currencies[:italy] = 'euro'
# puts currencies
# => yen
# {:japan=>"yen", :us=>"dollar", :italy=>"euro"}

def buy_set_burger(burger: "hamburger", potato: false, drink: true )
  if potato && drink
    puts "ご注文は#{burger}とpotatoとdrinkありです"
  elsif potato
    puts "ご注文は#{burger}とpotatoです"
  elsif drink
    puts "ご注文は#{burger}とdrinkありです"
  else
    puts "ご注文は#{burger}です"
  end
end

buy_set_burger(burger: 'cheeseburger', potato: true , drink: true )
# => ご注文はcheeseburgerとpotatoとdrinkありです
buy_set_burger()
# => ご注文はhamburgerとdrinkありです
buy_set_burger(burger: 'hamburger', potato: true )
# => ご注文はhamburgerとpotatoとdrinkありです