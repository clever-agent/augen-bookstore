class UpdateDeliveryCostFactor < ActiveRecord::Migration[5.2]
  def change
    rename_column :delivery_cost_factors, :base_factor, :base_cost
  end
end
