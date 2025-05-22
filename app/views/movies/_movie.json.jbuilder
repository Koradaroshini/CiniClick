json.extract! movie, :id, :title, :genre, :release_date, :rating, :description, :language, :created_at, :updated_at
json.url movie_url(movie, format: :json)
