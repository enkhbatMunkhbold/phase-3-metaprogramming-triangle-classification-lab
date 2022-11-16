require "pry"

class Triangle

  attr_accessor :a, :b, :c
  
  def initialize a, b, c
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && b == c && a == c
      :equilateral
    elsif a == b || a == c || b == c
      :isosceles
    else
      :scalene
    end
  end

  def is_every_side_greater_than_zero? 
    [a, b, c].all?(&:positive?)
  end

  def is_triangle_valid? 
    (a < b + c) && (b < a + c) && (c < a + b)
  end

  def validate_triangle
    raise TriangleError unless is_every_side_greater_than_zero? && is_triangle_valid?
  end

  class TriangleError < StandardError    
  end
end

# binding.pry

# noSizeTriangle = Triangle.new(0, 0, 0)
# noSizeTriangle.kind