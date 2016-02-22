class Numeric

  #round up to nearest increment
  def round_up_to(increment)
    reverse_increment = 1/increment
    (self * reverse_increment).ceil / reverse_increment
  end

end
