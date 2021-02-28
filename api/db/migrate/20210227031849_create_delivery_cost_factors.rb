class CreateDeliveryCostFactors < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_cost_factors do |t|
      t.decimal :base_factor
      t.decimal :jun_to_aug
      t.decimal :sep
      t.decimal :other_months

      t.timestamps
    end
  end
end
