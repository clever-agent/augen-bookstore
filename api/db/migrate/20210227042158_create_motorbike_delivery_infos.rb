class CreateMotorbikeDeliveryInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :motorbike_delivery_infos do |t|
      t.string :driver_name
      t.string :mobile
      t.integer :order_id

      t.timestamps
    end
  end
end
