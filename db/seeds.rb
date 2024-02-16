# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'json'
require 'open-uri'

# URL de l'API TMDB
url = 'https://tmdb.lewagon.com/movie/top_rated'

# Récupérer les données JSON de l'API
response = URI.open(url)
data = JSON.parse(response.read)

# Parcourir les films et les ajouter à la base de données
data['results'].first(100).each do |movie_data|
  Movie.create(
    title: movie_data['title'],
    overview: movie_data['overview'],
    poster_url: "https://image.tmdb.org/t/p/original#{movie_data['poster_path']}",
    rating: movie_data['vote_average']
  )
end

puts "Seed des films créée avec succès !"
