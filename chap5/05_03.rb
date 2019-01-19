# 旅行の準備はよりかんたんになる
class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(preparers)
    preparers.each{|preparer|
      preparer.prepare_trip(self)}
  end
end

# すべての準備者（Preparer）は
# ' prepare_trip ' に応答するダック
class Mechanic
  def prepare_trip(trip)
    trip.bicycles.each {|bicycle|
      prepare_bicycle(bicycle)}
  end

  # ...
end
