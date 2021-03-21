require_relative 'year'

class Calculator < ApplicationRecord
  has_many :years
  ANNUAL_INTEREST = 0.07 # in percentages (7%)
  NUMBER_TIMES_COMPOUNDED = 12 # per month

  def calculate_all_years
    self.years = []
    1.upto(self.years_amount) do |year|
      total_value = (compound_interest_start_value(year) + future_value_series(year)).round(2)
      saved_value = calculate_saved_value(year)
      compounded_value = (total_value - saved_value).round(2)
      self.years << Year.new(number: year, total: total_value, saved: saved_value, compounded: compounded_value)
    end
    self.years
  end

  def get_values_for_year(year)
    raise 'This year is not defined.' if year > self.years.length
    self.years[year-1]
  end

  def get_values_for_final_year
    self.years.last
  end

  private

  def calculate_saved_value(year)
    self.start_value + (self.monthly_input * NUMBER_TIMES_COMPOUNDED * year)
  end

  def compound_interest_start_value(year)
    self.start_value * ((1 + (ANNUAL_INTEREST / NUMBER_TIMES_COMPOUNDED))**(NUMBER_TIMES_COMPOUNDED*year))
  end

  def future_value_series(year)
    compound_multiplier = (ANNUAL_INTEREST / NUMBER_TIMES_COMPOUNDED)
    final_multiplier = (((1 + compound_multiplier)**(NUMBER_TIMES_COMPOUNDED*year)) - 1) / compound_multiplier

    self.monthly_input * final_multiplier
  end
end

# calculator = Calculator.new(100_000, 0, 20)
# calculator.calculate_all_years
# year = calculator.get_values_for_final_year
