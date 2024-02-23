class RoteirosController < ApplicationController

  def index
    @roteiros = Roteiro.all
  end

  def show
    #onde será mostrado os roteiros? no show do livro? ou em uma página separada?
    #página só para roteiros dos users + roteiros na pagina do book.
  end

  def new
    @roteiro = Roteiro.new
  end

  def create
    #usuário pode criar roteiro DELE para qualquer livro mas aprovação para todos usuários na página do livro passa pelo admin?
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
