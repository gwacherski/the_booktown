class RoteirosController < ApplicationController
  before_action :set_roteiro, only: [:show, :update, :destroy]

  def index
    @roteiros = Roteiro.all
  end

  def show
    @book = Book.find(params[:book_id])
  end

  def new
    @book = Book.find(params[:book_id])
    @roteiro = Roteiro.new

  end

  def create
    book_id = params[:book_id]
    @roteiro = Roteiro.new(roteiro_params)
    @book = Book.find(book_id)
    @roteiro.book = @book
    @roteiro.author = current_user.username
    if @roteiro.save
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @book = Book.find(params[:book_id])
    book_id = params[:book_id]
    @book = Book.find(book_id)
    @roteiro = Roteiro.find(params[:id])
  end

  def update
    # book_id = params[:book_id]
    @book = Book.find(@roteiro.book_id)
    if @roteiro.update(roteiro_params)
      redirect_to favorites_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(@roteiro.book_id)
    @roteiro.destroy
    redirect_to book_path(@book), notice: "Ordem deletada com sucesso."
  end

  private

  def set_roteiro
    @roteiro = Roteiro.find(params[:id])
  end

  def roteiro_params
    params.require(:roteiro).permit(:title, :activity_description, :location, :activity_address, :author,
                                    :estimated_time, :estimated_costs, :activity_done, photos: [])

  end

end


# FEATURES PARA SEREM IMPLEMENTADAS (Número na frente da feature é a prioridade)
# 1 Basico (create, show, edit, update, destroy)
# 1 Sistema de rating para o roteiro (0 a 5 por exemplo)
# 1 Roteiro mostra as reviews relacionadas a ele
# 1 Usuário: Edita e deleta apenas suas próprias roteiros, Administrador: Edita e deleta roteiros de qualquer usuário
# 1 Upload de fotos no roteiro (limitar quantidade de fotos por roteiro talvez)
# 1 Geocoding para o roteiro (pegar as localizações que o usuário passou e mostrar no mapa)
# 2 Mostrar data que o roteiro foi editado pela última vez (updated_at)
# 2 Ferramenta de compartilhar o roteiro (whatsapp, facebook, instagram, etc)
# 2/3 Durante a criação do roteiro, sugestões baseadas em OpenAI
