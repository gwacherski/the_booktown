class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # acts_as_favoritor

  has_many :favorites
  has_many :reviews, through: :roteiros
  has_many :books
  has_many :roteiros, through: :books

  has_one_attached :photo

  validates :username, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true

  attr_accessor :remove_photo

  before_save :check_for_photo_removal

  def check_for_photo_removal
    puts "Checking for photo removal"
    photo.purge if remove_photo == '1'
  end

  def favorite(roteiro)
    # Check if the user has already favorited the book
    unless favorite_roteiros.include?(book)
      # If not, create a new favorite
      favorites.create(roteiro: roteiro)
    end
  end
end
