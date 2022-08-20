require 'minitest/autorun'
require_relative '../lib/gate'
require_relative '../lib/ticket'

class GateTest < Minitest::Test
  def setup
    @umeda = Gate.new(:umeda)
    @juso = Gate.new(:juso)
    @mikuni = Gate.new(:mikuni)

    @ticket_160 = Ticket.new(160)
    @ticket_190 = Ticket.new(190)
  end

  def test_from_umeda_to_juso_charge_enough
    # 160円の切符を購入して梅田で乗車し、十三で降りる true
    ticket = @ticket_160

    @umeda.enter(ticket)
    assert @juso.exit(ticket)
  end

  def test_from_umeda_to_mikuni_charge_missing
    # 160円の切符を購入して梅田で乗車し、三国で降りる false
    ticket = @ticket_160

    @umeda.enter(ticket)
    assert !@mikuni.exit(ticket)
  end

  def test_from_umeda_to_mikuni_charge_enough
    # 190円の切符を購入して梅田で乗車し、三国で降りる
    ticket = @ticket_190

    @umeda.enter(ticket)
    assert @mikuni.exit(ticket)
  end

  def test_from_juso_to_mikuni_charge_enough
    ticket = @ticket_160

    @juso.enter(ticket)
    assert @mikuni.exit(ticket)
  end
end