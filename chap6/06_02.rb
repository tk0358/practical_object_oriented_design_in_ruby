class Bicycle
  attr_reader :style, :size, :tape_color, :front_shock, :rear_shock

  def initialize(args)
    @style = args[:style]
    @size = args[:size]
    @tape_color = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end

  # "style"の確認は、危険な道へ進む一歩
  def spares
    if style == :road
      { chain:  '10-speed',
        tire_size: '23',        # milimeters
        tape_color: tape_color}
    else
      { chain: '10-speed',
        tire_size: '2.1',       # inches
        rear_shock: rear_shock}
    end
  end

  # ほかにもメソッドがたくさん...
end

bike = Bicycle.new(
         style: :mountain,
         size: 'S',
         front_shock: 'Maintou',
         rear_shock: 'Fox')
        
p bike.spares
