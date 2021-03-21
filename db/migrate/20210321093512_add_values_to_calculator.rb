class AddValuesToCalculator < ActiveRecord::Migration[6.0]
  def change
    add_column :calculators, :start_value, :float
    add_column :calculators, :monthly_input, :float
    add_column :calculators, :years_amount, :integer
  end
end
