# 9.5 ダックタイプをテストする - ロールをテストする

require_relative '../lib/09_06'
require 'minitest/autorun'

module PreparerInterfaceTest
  def test_implements_the_preparer_interface
    assert_respond_to(@object, :prepare_trip)
  end
end

class MechanicTest < Minitest::Unit::TestCase
  include PreparerInterfaceTest

  def setup
    @mechanic = @object = Mechanic.new
  end

  # @mechanic に依存するほかのテスト
end

class TripCoordinatorTest < Minitest::Unit::TestCase
  include PreparerInterfaceTest

  def setup
    @trip_coordinator = @object = TripCoordinator.new
  end
end

class DriverTest < Minitest::Unit::TestCase
  include PreparerInterfaceTest

  def setup
    @driver = @object = Driver.new
  end
end

class TripTest < Minitest::Unit::TestCase

  def test_requests_trip_preparation
    @preparer = Minitest::Mock.new
    @trip = Trip.new
    @preparer.expect(:prepare_trip, nil, [@trip])

    @trip.prepare([@preparer])
    @preparer.verify
  end
end
