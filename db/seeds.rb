# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

drama_list = List.create(name: "Drama")
action_list = List.create(name: "Action")
favorites_list = List.create(name: "My Favorites")

titanic = Movie.create(title: "Titanic", overview: "ship sinks", poster_url: "https://media.gettyimages.com/id/1371352456/pt/foto/rms-titanic-departing-southampton-on-10-april-1912.jpg?s=612x612&w=gi&k=20&c=mPKTk_fCvR3GlBN0iz49OxJW4YNLwNIa2n2qXAwEBZc=", rating: 7)
startWars = Movie.create(title: "Star Wars", overview: "Galatic battles", poster_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Star_Wars_Logo.svg/1200px-Star_Wars_Logo.svg.png", rating: 8)
got = Movie.create(title: "Game of Thrones", overview: "Kings will fall", poster_url: "https://static.hbo.com/game-of-thrones-1-1920x1080.jpg", rating: 10)

# Bookmark.create(comment: "Drama that i must see");
Bookmark.create(comment: "Drama that i must see", movie_id: titanic.id, list_id: drama_list.id);
Bookmark.create(comment: "The iconic start wars", movie_id: startWars.id, list_id: action_list.id);
Bookmark.create(comment: "", movie_id: startWars.id, list_id: favorites_list.id);
Bookmark.create(comment: "Dragons and swords", movie_id: got.id, list_id: action_list.id);
