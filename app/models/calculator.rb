class Calculator # < ApplicationRecord TODO how to make this a ApplicationRecord with intitialize?
  def initialize(start_value, monthly_input, years)
    @start_value = start_value
    @monthly_input = monthly_input
    @years = years
    @annual_interest = 0.07 # in percentages
    @expected_value = nil
  end

  def calculate_expected_value
    @get_expected_value = (compound_interest_start_value + future_value_series).round(2)
    @get_expected_value
  end

  def get_expected_value
    @expected_value
  end

  def compound_interest_start_value
    number_times_compounded = 12
    @start_value * ((1 + (@annual_interest / number_times_compounded))**(number_times_compounded*@years))
  end

  def future_value_series
    number_times_compounded = 12
    compound_multiplier = (@annual_interest / number_times_compounded)
    final_multiplier = (((1 + compound_multiplier)**(number_times_compounded*@years)) - 1) / compound_multiplier

    @monthly_input * final_multiplier
  end
end
