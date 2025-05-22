class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.integer :showtime_id
      t.integer :number_of_tickets
      t.decimal :total_amount

      t.timestamps
    end
  end
end
