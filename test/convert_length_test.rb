require 'minitest/autorun'
require_relative '../lib/convert_length'

class ConvertLengthTest < Minitest::Test
  def test_from_1_meter_to_inch
    assert_equal 39.37, convert_length(value: 1, from_unit: :m, to_unit: :in)
  end

  def test_from_15_inch_to_meter
    assert_equal 0.38, convert_length(value: 15, from_unit: :in, to_unit: :m)
  end

  def test_from_35000_ft_to_meter
    assert_equal 10670.73, convert_length(value: 35000, from_unit: :ft, to_unit: :m)
  end

  def test_from_23_8_inch_to_meter
    assert_equal 0.60, convert_length(value: 23.8, from_unit: :in, to_unit: :m)
  end
end