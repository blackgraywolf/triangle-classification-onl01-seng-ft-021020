require 'pry'


# class to determine Triangle type
class Triangle
  class TriangleError < StandardError
  #can add message here
end
  def initialize(a, b, c)
    @sides = [a, b, c]
    validate
  end

  def kind
   #binding.pry
   equilateral? ||  isosceles? || scalene?

  end

  private

  def validate
    no_sides? || negative_sides? || triangle_inequality?
  end

  def no_sides?
    # binding.pry
  
    fail TriangleError, 'sides have no length' if @sides.any? { |n| n == 0}
  end

  def negative_sides?
   
    fail TriangleError, 'negative side(s)' if @sides.find { |n| n < 0 }
  end

  def triangle_inequality?
    sorted = @sides.sort
    fail TriangleError, 'inequality' if sorted[0] + sorted[1] <= sorted[2]
  end

  def equilateral?
    :equilateral if unique_sides == 3
  end

  def isosceles?
   #  binding.pry
    :isosceles if unique_sides == 2
  end

  def scalene?
    
    :scalene if unique_sides == 1
  end

  def unique_sides
  
  num = 0
  @sides = [2,3,3]
   @sides.each {|n| if @sides[0] == n 
     num += 1
   end
   }
   
   num
  #  binding.pry
  end
end