require_relative 'year'

class Calculator # < ApplicationRecord TODO how to make this a ApplicationRecord with intitialize?
  attr_reader :final_value

  def initialize(start_value, monthly_input, years)
    @start_value = start_value
    @monthly_input = monthly_input
    @annual_interest = 0.07 # in percentages (7%)
    @final_value = nil
    @number_times_compounded = 12
    @years = [*1..years]
  end

  def calculate_all_years
    @years = @years.each_with_index.map do |year, i|
      total_value = (compound_interest_start_value(year) + future_value_series(year)).round(2)
      saved_value = calculate_saved_value(year)
      compounded_value = (total_value - saved_value).round(2)
      Year.new(i+1, total_value, saved_value, compounded_value)
    end
    @years
  end

  def get_values_for_year(year)
    @years[year-1]
  end

  def get_values_for_final_year
    @years.last
  end

  def get_compounded_increase(year)
      @final_value - (@monthly_input * @number_times_compounded * year) - @start_value
  end

  def calculate_saved_value(year)
    @start_value + (@monthly_input * @number_times_compounded * year)
  end

  def compound_interest_start_value(year)
    @start_value * ((1 + (@annual_interest / @number_times_compounded))**(@number_times_compounded*year))
  end

  def future_value_series(year)
    compound_multiplier = (@annual_interest / @number_times_compounded)
    final_multiplier = (((1 + compound_multiplier)**(@number_times_compounded*year)) - 1) / compound_multiplier

    @monthly_input * final_multiplier
  end
end

calculator = Calculator.new(100_000, 0, 20)
calculator.calculate_all_years
year = calculator.get_values_for_final_year
