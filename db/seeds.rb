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

# Certifique-se de substituir 'YOUR_API_KEY' pelo seu próprio chave de API do Google Books.
GOOGLE_BOOKS_API_KEY = 'AIzaSyClvl56GQ8PDo8-hDutJxpwNo6DujM2fm4'

Book.destroy_all
User.destroy_all
Roteiro.destroy_all
Review.destroy_all

user = User.create!(
  email: "amor@love.com",
  password: "123456",
  first_name: "Amor",
  last_name: "Love",
  username: "amorlove",
  admin: true
)



def fetch_google_books(author)
  puts 'fazendo o seed'
  query_author = author.gsub(' ', '%20')
  base_url = 'https://www.googleapis.com/books/v1/volumes'
  query_url = "#{base_url}?q=inauthor:#{query_author}&maxResults=6&key=#{GOOGLE_BOOKS_API_KEY}"

  response = HTTParty.get(query_url)
  items = response['items']

  return [] unless items

  #books = []
  items.each do |item|
    volume_info = item['volumeInfo']
    name = volume_info['title']
    author = volume_info['authors']&.join(', ')
    description = volume_info['description']
    medium = volume_info['imageLinks']['thumbnail'] if volume_info['imageLinks'] && volume_info['imageLinks']['thumbnail']

    user = User.first

    book = Book.new(name: name, author: author, description: description, thumbnail: medium, user: user)
    book.save! if book.thumbnail.present? && book.valid? && book.description.present?
  end
end

fetch_google_books('Machado de Assis')
fetch_google_books('Thomas Harris')
fetch_google_books('Paulo Coelho')
fetch_google_books('Arthur Conan Doyle')

roteiro = Roteiro.create!(
  description: '',
  author: 'Kelle',
  location: 'Praia do Leme',
  rating: 4.5,
  title: 'Só praia e amor',
  activity_description: 'Test activity description',
  activity_address: 'Test activity address',
  estimated_time: 2.5,
  estimated_costs: 100.0,
  activity_done: false,
  book_id: Book.first.id
)

review = Review.create!(
  description: "Ótima experiência!",
  rating: 4.8,
  created_by: "Alice",
  user_id: user.id,
  roteiro_id: roteiro.id
)

User.create!(
  email: "admin@admin.com",
  password: "123456",
  first_name: "Admin",
  last_name: "Istrator",
  username: "The Admin",
  admin: true
)

puts 'entrance'
puts user.errors.messages
puts review.errors.messages
puts roteiro.errors.messages
puts "fim"
