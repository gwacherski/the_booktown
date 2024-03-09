# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'httparty'

Book.destroy_all
User.destroy_all
Roteiro.destroy_all
Review.destroy_all

user = User.new(email: "amor@love.com", password: "123456", first_name: "Amor", last_name: "Love", username: "amorlove", admin: true)
user.save!

def fetch_google_books(author)
  puts 'fazendo o seed'
  api_key = 'AIzaSyClvl56GQ8PDo8-hDutJxpwNo6DujM2fm4'
  base_url = 'https://www.googleapis.com/books/v1/volumes'
  query_author = author.gsub(' ', '%20')

  query_url = "#{base_url}?q=inauthor:#{query_author}&maxResults=6&key=#{api_key}"

  response = HTTParty.get(query_url)
  items = response['items']

  return [] unless items

  books = []
  items.each do |item|
    volume_info = item['volumeInfo']
    name = volume_info['title']
    author = volume_info['authors']&.join(', ')
    description = volume_info['description']
    user = User.first

    books << { name: name, author: author, description: description, user: user}
  end
  puts books[0]
  books.each do |book|
    Book.create!(book)
  end
end

fetch_google_books('Machado de Assis')
fetch_google_books('Thomas Harris')
fetch_google_books('Paulo Coelho')
fetch_google_books('Arthur Conan Doyle')

roteiro = Roteiro.new(
  description: '',
  author: 'Test author',
  location: 'Test location',
  rating: 4.5,
  title: 'Test title',
  activity_description: 'Test activity description',
  activity_address: 'Test activity address',
  estimated_time: 2.5,
  estimated_costs: 100.0,
  activity_done: false,
  book_id: Book.first.id
)
roteiro.save!

review = Review.new(
  description: "Ótima experiência!",
  rating: 4.8,
  created_by: "Alice",
  user_id: user.id,
  roteiro_id: roteiro.id
)
review.save!

puts 'entrance'
puts user.errors.messages
puts review.errors.messages
puts roteiro.errors.messages
puts "fim"
