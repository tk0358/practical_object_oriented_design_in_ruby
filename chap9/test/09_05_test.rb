#  9.4 送信メッセージをテストする

require_relative '../lib/09_05'
require 'minitest/autorun'

class GearTest < MiniTest::Unit::TestCase

  def setup
    @observer = MiniTest::Mock.new
    @gear = Gear.new(
              chainring: 52,
              cog: 11,
              observer: @observer )
  end

  def test_notifies_observers_when_cogs_change
    @observer.expect(:changed, true, [52, 27])
    @gear.set_cog(27)
    @observer.verify
  end

  def test_notifies_observers_when_chainrings_change
    @observer.expect(:changed, true, [42, 11])
    @gear.set_chainring(42)
    @observer.verify
  end
end
