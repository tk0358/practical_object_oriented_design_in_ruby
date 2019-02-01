# 9.5 ダックタイプをテストする
# 「第５章　ダックタイイングでコストを削減する」のPreparerダックタイプのコード

# すべての準備者（Preparer）は
# ' prepare_trip ' に応答するダック
class Mechanic
  def prepare_trip(trip)
    trip.bicycles.each {|bicycle|
      prepare_bicycle(bicycle)}
  end

  # ...
end

class TripCoordinator
  def prepare_trip(trip)
    buy_food(trip.customers)
  end

  #...
end

class Driver
  def prepare_trip(trip)
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
  end
  #...
end

class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(preparers)
    preparers.each{|preparer|
      preparer.prepare_trip(self)}
  end
end
