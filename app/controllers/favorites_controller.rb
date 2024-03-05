# app/controllers/favorites_controller.rb
class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites
  end

  def show
    @favorite = current_user.favorites.find(params[:id])
  end

  def new
    @favorite = current_user.favorites.new
  end

  def create
    roteiro = Roteiro.find(params[:roteiro_id])
    current_user.favorites.create(roteiro: roteiro)
    redirect_to roteiros_path, notice: 'Roteiro favoritado com sucesso.'
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy
    redirect_to favorites_path, notice: 'Favorito removido com sucesso.'
  end
end
