class CreateCalculators < ActiveRecord::Migration[6.0]
  def change
    create_table :calculators do |t|

      t.timestamps
    end
  end
end
