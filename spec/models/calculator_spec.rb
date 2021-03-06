require 'rails_helper'

RSpec.describe Calculator, type: :model do
  context 'returns an expected value if monthly input and years are given' do
    let(:monthly_input) { 1_000 }
    let(:years) { 5 }

    it 'has no start value' do
      start_value = 0
      calculator = Calculator.new(start_value, monthly_input, years)
      expect(calculator.calculate_expected_value()).to eq 71_592.90
    end

    it 'has a start value' do
      start_value = 10_000
      calculator = Calculator.new(start_value, monthly_input, years)
      expect(calculator.calculate_expected_value()).to eq 85_769.15
    end
  end
end
