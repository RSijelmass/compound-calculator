require 'rails_helper'

RSpec.describe Calculator do
    let(:monthly_input) { 1_000 }
    let(:years) { 5 }

    context 'has no start value' do
      let(:start_value) { 0 }
      it 'returns expected total value' do
        calculator = Calculator.new(start_value, monthly_input, years)
        expect(calculator.calculate_expected_value()).to eq 71_592.90
      end
    end

    context 'has a start value' do
      let(:start_value) { 10_000 }

      it 'returns expected total value' do
        calculator = Calculator.new(start_value, monthly_input, years)
        expect(calculator.calculate_expected_value()).to eq 85_769.15
      end

      it 'returns the saved amount over time' do
        start_value = 10_000
        calculator = Calculator.new(start_value, monthly_input, years)
        expect(calculator.calculate_saved_value()).to eq 70_000
      end
    end
end
