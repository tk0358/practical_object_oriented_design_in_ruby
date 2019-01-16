class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * diameter
  end

  def ratio
    chainring / cog.to_f
  end
    
  def diameter
    wheel.diameter
  end

  def wheel
    @wheel ||= Wheel.new(rime, tire)
  end
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end
end
p Gear.new(52, 11, 26, 1.5).gear_inches
