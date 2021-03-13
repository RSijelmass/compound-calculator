class Calculator # < ApplicationRecord TODO how to make this a ApplicationRecord with intitialize?
  def initialize(start_value, monthly_input, years)
    @start_value = start_value
    @monthly_input = monthly_input
    @years = years
    @annual_interest = 0.07 # in percentages (7%)
    @expected_value = nil
    @number_times_compounded = 12
  end

  def calculate_expected_value
    @get_expected_value = (compound_interest_start_value + future_value_series).round(2)
    @get_expected_value
  end

  def get_compounded_increase
    @get_expected_value - (@monthly_input * @number_times_compounded * @years) - @start_value
  end

  def get_expected_value
    @expected_value
  end

  def calculate_saved_value
    @start_value + (@monthly_input * @number_times_compounded * @years)
  end

  def compound_interest_start_value
    @start_value * ((1 + (@annual_interest / @number_times_compounded))**(@number_times_compounded*@years))
  end

  def future_value_series
    compound_multiplier = (@annual_interest / @number_times_compounded)
    final_multiplier = (((1 + compound_multiplier)**(@number_times_compounded*@years)) - 1) / compound_multiplier

    @monthly_input * final_multiplier
  end
end

calculator = Calculator.new(70_000, 2200, 5)
puts "total value: #{calculator.calculate_expected_value}"
puts "compounded: #{calculator.get_compounded_increase}"
