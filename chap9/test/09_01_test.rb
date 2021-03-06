require_relative '../lib/09_01'
require 'minitest/autorun'

class WheelTest < Minitest::Unit::TestCase

  def test_calculates_diameter
    wheel = Wheel.new(26, 1.5)

    assert_in_delta(29, wheel.diameter, 0.01)
  end
end

class GearTest < Minitest::Unit::TestCase

  def test_calculates_gear_inches
    gear = Gear.new(
            chainring: 52,
            cog: 11,
            rim: 26,
            tire: 1.5
    )

    assert_in_delta(137.1, gear.gear_inches, 0.01)
  end
end
