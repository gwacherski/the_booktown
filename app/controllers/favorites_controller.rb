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
    @favorite = Favorite.new(roteiro_id: params[:roteiro_id], user: current_user)
    if @favorite.save
      redirect_to favorites_path, notice: 'Favorito adicionado com sucesso.'
    else
      flash[:alert] = 'Erro ao adicionar favorito.'
    end
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy
    redirect_to favorites_path, notice: 'Favorito removido com sucesso.'
  end
end
