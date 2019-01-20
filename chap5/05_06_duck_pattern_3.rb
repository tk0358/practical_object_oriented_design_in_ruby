# ダックパターン3
# respond_to?

class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(preparers)
    preparers.each {|preparer|
      if preparer.respond_to?(:prepare_bicycles)
        preparer.prepare_bicycles(bicycle)
      elsif preparer.respond_to?(:buy_food)
        preparer.buy_food(customers)
      elsif preparer.respond_to?(:gas_up)
        preparer.gas_up(vehicle)
        preparer.fill_water_tank(vehicle)
      end
    }
  end
end
