class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :restaurant_id, index: true
      t.string :name
      t.datetime :reservation_at

      t.timestamps null: false
    end
  end
end
