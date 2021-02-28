class CreateTrainDeliveryInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :train_delivery_infos do |t|
      t.string :train_no
      t.string :station_of_arrival
      t.integer :order_id

      t.timestamps
    end
  end
end
