class CreateOrderInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :order_infos do |t|
      t.string :book_link
      t.string :book_title
      t.datetime :delivery_date
      t.decimal :cost
      t.string :delivery_type
      t.string :status

      t.timestamps
    end
  end
end
