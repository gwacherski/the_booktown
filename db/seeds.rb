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

User.create(email: "amor@love.com", password: "123456")

Review.create(
  description: "Ótima experiência!",
  rating: 4.8,
  created_by: "Alice",
  user_id: User.first
)

Roteiro.create(
  description: "Viagem à Praia",
  author: "João",
  location: "Praia do Sol",
  rating: 4.5,
  review_id: Review.first
)

puts 'entrance'
puts User.first
puts Review.first
puts Roteiro.first
puts "fim"

def fetch_google_books(author)
  puts 'fazendo o seed'
  api_key = 'AIzaSyClvl56GQ8PDo8-hDutJxpwNo6DujM2fm4'
  base_url = 'https://www.googleapis.com/books/v1/volumes'
  query_author = author.gsub(' ', '%20')

  query_url = "#{base_url}?q=inauthor:#{query_author}&maxResults=10&key=#{api_key}"

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
    roteiro = Roteiro.first
    puts roteiro
    books << { name: name, author: author, description: description, user: user, roteiro_id: roteiro}
  end
  puts books[0]
  books.each do |book|
    Book.create!(book)
  end
end

fetch_google_books('Machado de Assis')
