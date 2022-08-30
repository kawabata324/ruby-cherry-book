require 'minitest/autorun'
require_relative '../lib/convert_length'

class ConvertLengthTest < Minitest::Test
  def test_from_1_meter_to_inch
    assert_equal 39.37, convert_length(1, 'm', 'in')
  end

  def test_from_15_inch_to_meter
    assert_equal 0.38, convert_length(15, 'in', 'm')
  end

  def test_from_35000_ft_to_meter
    assert_equal 10670.73, convert_length(35000, 'ft', 'm')
  end
end