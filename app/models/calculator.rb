class Calculator # < ApplicationRecord TODO how to make this a ApplicationRecord with intitialize?
  def initialize(start_value, monthly_input, years)
    @start_value = start_value
    @monthly_input = monthly_input
    @years = years
    @compound_interest = 1.07 # in percentages
    @expected_value = nil
  end

  def calculate_expected_value
    @expected_value = (@start_value + (@monthly_input * 1.07**@years)).round(2)
    @expected_value
  end

  def get_expected_value
    @expected_value
  end
end
