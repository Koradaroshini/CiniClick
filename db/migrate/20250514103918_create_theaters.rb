class CreateTheaters < ActiveRecord::Migration[7.2]
  def change
    create_table :theaters do |t|
      t.string :name
      t.string :location
      t.integer :number_of_seats

      t.timestamps
    end
  end
end
