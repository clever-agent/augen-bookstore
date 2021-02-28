class AddServiceToDeliveryCostFactors < ActiveRecord::Migration[5.2]
  def change
    add_column :delivery_cost_factors, :service, :string
  end
end
