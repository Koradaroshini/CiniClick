class CreateShowtimes < ActiveRecord::Migration[7.2]
  def change
    create_table :showtimes do |t|
      t.integer :movie_id
      t.references :theater, null: false, foreign_key: true
      t.datetime :show_date
      t.integer :available_seats

      t.timestamps
    end
  end
end
