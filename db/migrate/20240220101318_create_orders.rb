class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
    t.string :name
    t.text :phone
    t.text :address

    t.timestamps
    end
  end
end
