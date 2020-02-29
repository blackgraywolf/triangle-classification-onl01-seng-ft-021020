require 'pry'
class TriangleError < StandardError; end

# class to determine Triangle type
class Triangle
  def initialize(a, b, c)
    @sides = [a, b, c]
    validate
  end

  def kind
    equilateral? || isosceles? || scalene?
  end

  private

  def validate
    no_sides? || negative_sides? || triangle_inequality?
  end

  def no_sides?
    # binding.pry
    fail TriangleError, 'sides have no length' if sorted[0] == 0 && sorted[1] == 0 && sorted[2] == 0
    #@sides.size { |n| n = 0 }
  end

  def negative_sides?
   
    fail TriangleError, 'negative side(s)' if @sides.find { |n| n < 0 }
  end

  def triangle_inequality?
    sorted = @sides.sort
    fail TriangleError, 'inequality' if sorted[0] + sorted[1] <= sorted[2]
  end

  def equilateral?
    :equilateral if unique_sides == 1
  end

  def isosceles?
    :isosceles if unique_sides == 2
  end

  def scalene?
    :scalene if unique_sides == 3
  end

  def unique_sides
    @sides.uniq.size
  end
end