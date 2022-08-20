require 'minitest/autorun'

class GateTest < Minitest::Test
  def test_from_umeda_to_mikuni_charge_missing
    # 改札機オブジェクトの作成
    umeda = Gate.new(:umeda)
    mikuni = Gate.new(:mikuni)

    # 160円の切符を購入して梅田で乗車し、三国で降りる
    ticket = Ticket.new(160)
    umeda.enter(ticket)
    assert_not mikuni.exit(ticket) #=> false
  end
end