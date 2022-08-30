require 'minitest/autorun'
require_relative '../lib/convert_length'

class ConvertLengthTest < Minitest::Test
  def test_from_1_meter_to_inch
    assert_equal 39.37, convert_length(1, 'm', 'in')
  end
end