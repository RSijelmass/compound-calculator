class Year # < ApplicationRecord
  attr_accessor :total, :saved, :compounded
  def initialize(number, total, saved, compounded)
    @number = number
    @total = total
    @saved = saved
    @compounded = compounded
  end
end
