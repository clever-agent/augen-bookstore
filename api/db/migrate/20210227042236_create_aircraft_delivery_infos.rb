class CreateAircraftDeliveryInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :aircraft_delivery_infos do |t|
      t.string :flight_no
      t.string :gate_of_arrival
      t.integer :order_id

      t.timestamps
    end
  end
end
