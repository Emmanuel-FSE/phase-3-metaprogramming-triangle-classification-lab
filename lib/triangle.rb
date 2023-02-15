class Triangle
  class TriangleError < StandardError
  end

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
  end

  def kind
    if @sides.any? {|side| side <= 0} || !triangle_inequality?
      raise TriangleError
    elsif @sides.uniq.size == 1
      :equilateral
    elsif @sides.uniq.size == 2
      :isosceles
    else
      :scalene
    end
  end

  def triangle_inequality?
    @sides.max < @sides.inject(:+) - @sides.max
  end
end
