# Gearが外部インターフェースの一部の場合
module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel
    def initialize(args)
      @chainring = args.fetch(:chainring, 40)
      @cog = args.fetch(:cog, 18)
      @wheel = args[:wheel]
    end

    def gear_inches
      ratio * diameter
    end

    def diameter
      wheel.diameter
    end

    def ratio
      chainring / cog.to_f
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
end

# 外部のインターフェースをラップし、自身を変更から守る
module GearWrapper
  def self.gear(args)
    SomeFramework::Gear.new(args[:chainring], args[:config], args[:wheel])
  end
end

p Gear.new(
  :chainring => 52,
  :cog => 11,
  :wheel => Wheel.new(26, 1.5)).gear_inches
