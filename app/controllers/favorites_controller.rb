class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where(user: current_user)
  end

  def show
    #find do book favorito pela planilha favoritos BOOK.ID e USER.ID
    #each do? para mostrar em lista, ou em cards menores (como no instagram)
  end

  def new
    @favorite = Favorite.new
  end

  def create
    #fav com user.id e book.id
    #salvar planilha fav;
    #redirecionar para (onde)?
    #é possível favoritar direto da página de index? como small icon
  end

  def edit
    #edit seria alterar de favorito para não favorito? ou seria destroy/update?
    #edit se faz necessário?
  end

  def update
    #edit seria alterar de favorito para não favorito? ou seria destroy?
  end

  def destroy
    #edit seria alterar de favorito para não favorito? ou seria destroy?
  end


end
