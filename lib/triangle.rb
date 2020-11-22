
class Triangle

  attr_reader :lengths

  def initialize(length_1, length_2, length_3)
    @lengths = Array.new.insert(0, length_1, length_2, length_3)
  end

  def kind
    if exists? && tri_inequality?
      if all_equal?
        :equilateral
      elsif no_equal?
        :scalene
      else
        :isosceles
      end
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end

  def exists?
    self.lengths.all? {|l| l > 0}
  end

  def tri_inequality?
    self.lengths.each_with_index.all? do |len, i|
      len + self.lengths[i-1] > self.lengths[i-2]
    end
  end

  def all_equal?
    self.lengths.uniq.size <= 1
  end

  def no_equal?
    self.lengths.uniq.size == 3
  end
end

