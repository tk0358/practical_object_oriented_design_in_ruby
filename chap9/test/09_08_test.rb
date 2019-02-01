# 9.5 ダックタイプをテストする - ロールを使ったダブルのバリエーション
# 「夢の世界に生きる」問題を解決

require_relative '../lib/09_08'
require 'minitest/autorun'

module DiameterizableInterfaceTest
  def test_implements_the_diameterizable_interface
    assert_respond_to(@object, :width)
  end
end

class WheelTest < Minitest::Unit::TestCase
  include DiameterizableInterfaceTest

  def setup
    @wheel = @object = Wheel.new(26, 1.5)
  end

  def test_calculates_diameter
    assert_in_delta(29, @wheel.width, 0.01)
  end
end

class DiameterDouble
  def width # テスト失敗1によってdiameterからwidthへの変更を促す
    10
  end
end

# 該当の　test double が、このテストが期待する
# インターフェースを守ることを証明する
class DiameterDoubleTest < Minitest::Unit::TestCase
  include DiameterizableInterfaceTest

  def setup
    @object = DiameterDouble.new
  end
end

class GearTest < Minitest::Unit::TestCase
  def test_calculates_gear_inches
    gear = Gear.new(
            chainring: 52,
            cog: 11,
            wheel: DiameterDouble.new)

    assert_in_delta(47.27, gear.gear_inches, 0.01)
  end
end
