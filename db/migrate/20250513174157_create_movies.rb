class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.date :release_date
      t.decimal :rating
      t.text :description
      t.string :language

      t.timestamps
    end
  end
end
