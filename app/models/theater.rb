class Theater < ApplicationRecord
   has_many :showtimes, dependent: :destroy
end
