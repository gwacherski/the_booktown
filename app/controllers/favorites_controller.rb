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
    #é possível favoritar direto da página de index? como small icon - Com stimulus, criar um ícone de favoritar e desfavoritar
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


# FEATURES PARA SEREM IMPLEMENTADAS (Número na frente da feature é a prioridade)
# 1 Basico (create, show, edit, update, destroy)
# 1 Tentar utilizar Stimulus para criar um botão de favoritar e desfavoritar na página do book
# 1 Mostrar os favoritos do usuário na página do usuário (uma rota dedicada a isso)
# 1 Mostrar quantos favoritos o book tem na página do book (métodod search? algo assim)

