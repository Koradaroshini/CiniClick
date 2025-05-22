class Movie < ApplicationRecord
    has_one_attached :main_image
    validates :main_image, :title, :genre, :release_date, :rating, :description, :language , presence:true
end
