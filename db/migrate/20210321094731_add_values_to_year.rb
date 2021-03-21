class AddValuesToYear < ActiveRecord::Migration[6.0]
  def change
    add_column :years, :saved, :float
    add_column :years, :total, :float
    add_column :years, :compounded, :float
    add_column :years, :number, :integer
  end
end
