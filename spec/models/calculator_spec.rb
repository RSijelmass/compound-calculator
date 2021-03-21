require 'rails_helper'

RSpec.describe Calculator do
    let(:monthly_input) { 1_000 }
    let(:years) { 5 }

    context 'has a start value' do
      let(:start_value) { 10_000 }

      it 'can return the value generated of a certain year' do
        calculator = Calculator.new(start_value, monthly_input, years)
        calculator.calculate_all_years
        actual_year = calculator.get_values_for_year(3)

        expect(actual_year.total).to eq 52_259.36
        expect(actual_year.saved).to eq 46_000
        expect(actual_year.compounded).to eq 6_259.36
      end

      it 'can return the value generated of the final year' do
        calculator = Calculator.new(start_value, monthly_input, years)
        calculator.calculate_all_years
        actual_year = calculator.get_values_for_final_year

        expect(actual_year.total).to eq 85_769.15
        expect(actual_year.saved).to eq 70_000
        expect(actual_year.compounded).to eq 15_769.15
      end
    end

    context 'has no start value' do
      let(:start_value) { 0 }
      it 'returns expected total value' do
        calculator = Calculator.new(start_value, monthly_input, years)
        calculator.calculate_all_years
        actual_year = calculator.get_values_for_final_year

        expect(actual_year.total).to eq 71_592.90
        expect(actual_year.saved).to eq 60_000
        expect(actual_year.compounded).to eq 11_592.90
      end
    end

    context 'out of bounds' do
      let(:start_value) { 0 }

      it 'fetches a year that does not exist' do
        calculator = Calculator.new(start_value, monthly_input, years)
        out_of_bound_year = years + 1
        calculator.calculate_all_years
        expect { calculator.get_values_for_year(out_of_bound_year) }.to raise_error 'This year is not defined.'
      end
    end
end
