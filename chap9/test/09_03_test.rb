require_relative '../lib/09_02'
require 'minitest/autorun'

class DiameterDouble
  def diameter
    10
  end
end

class GearTest < Minitest::Unit::TestCase
  def test_calculates_gear_inches
    gear = Gear.new(
            chainring: 52,
            cog: 11,
            wheel: DiameterDouble.new
    )

    assert_in_delta(47.27, gear.gear_inches, 0.01)
  end
end
