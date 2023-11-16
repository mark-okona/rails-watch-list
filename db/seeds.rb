# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
require"json"

Movie.destroy_all
List.destroy_all

filepath = "https://tmdb.lewagon.com/movie/top_rated"
serialized_movie_list = URI.open(filepath).read
movie_list = JSON.parse(serialized_movie_list)

movie_list['results'].each do |movie|
  Movie.create(title: movie['original_title'], overview: movie['overview'], poster_url: movie['poster_path'], rating: movie['vote_average'])
end

list_name_array = ["Crime", "Good", "Bad", "Tense", "Chill", "Criterion", "Mubi", "New" ]

list_name_array.each do |item|
  List.create(name: item)
end
