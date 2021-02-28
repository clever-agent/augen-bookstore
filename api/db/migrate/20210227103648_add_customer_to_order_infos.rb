class AddCustomerToOrderInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :order_infos, :customer_name, :string
    add_column :order_infos, :customer_address, :string
  end
end
