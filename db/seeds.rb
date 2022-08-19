
require "json"
require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# puts "Creating Movies"

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

# puts "Movies created"






# Movie.destroy_all
# List.destroy_all
# Bookmark.destroy_all
# puts "Creating..."

# url = "http://tmdb.lewagon.com/movie/top_rated"
# document_movies = URI.open("#{url}?page=1").read
# hashes_movies = JSON.parse(document_movies)['results']

# 10.times do
#   hashes_movies.each do |movie|
#     base_image_url = 'https://image.tmdb.org/t/p/original'
#     movie_new = Movie.new(
#       title: movie['title'],
#       overview: movie['overview'],
#       poster_url: "#{base_image_url}#{movie['backdrop_path']}",
#       rating: movie['vote_average']
#     )
#     movie_new.save!
#   end
# end



puts "Cleaning databases..."
Movie.destroy_all
puts "Creating database.."
url = 'https://tmdb.lewagon.com/movie/top_rated'
puts "Calling movie API"
10.times do |i|
  puts "Importing movies from page #{i + 1}"
  movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)['results']
  movies.each do |movie|
    puts "Generating movies"
    base_poster_url = "https://image.tmdb.org/t/p/original"
    Movie.create(
      title: movie["title"],
      overview: movie["overview"],
      poster_url: "#{base_poster_url}#{movie["backdrop_path"]}",
      rating: movie['rating']
    )
  end
end

puts List.create(name: "Happy Movies")
puts List.create(name: "Sad Movies")
puts List.create(name: "Coding Movies")

puts "Finished creating!"
