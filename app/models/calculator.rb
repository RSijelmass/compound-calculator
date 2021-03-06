class Calculator # < ApplicationRecord TODO how to make this a ApplicationRecord with intitialize?
  def initialize(start_value, monthly_input, years)
    @start_value = start_value
    @monthly_input = monthly_input
    @years = years
    @annual_interest = 0.07 # in percentages
    @expected_value = nil
  end

  def calculate_expected_value
    @get_expected_value = (future_value_series).round(2)
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


  # def calculate_compound_interest_start_value
  #   compound_frequency = 12 # TODO do we want to make period flexible?
  #   compound_interest = @start_value * (1 + (@compound_annual_interest / compound_frequency))**(compound_frequency*@years)
  #   compound_interest
  # end
  #
  # def future_value_series
  #   compound_frequency = 12 # TODO do we want to make period flexible?
  #   interest_calculation = (((1+ (@compound_annual_interest / compound_frequency))**(compound_frequency*@years)) - 1) / (@compound_annual_interest / compound_frequency)
  #   future_value = @monthly_input * interest_calculation
  #   future_value
  # end
end

calculator = Calculator.new(70_000, 2200, 3)
puts calculator.calculate_expected_value()
