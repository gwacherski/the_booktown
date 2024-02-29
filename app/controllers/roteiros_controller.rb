class RoteirosController < ApplicationController
  before_action :set_roteiro, only: [:show, :edit, :update, :destroy, :update_rating]

  def index
    @roteiros = Roteiro.all
  end

  def show
  end

  def new
    @roteiro = Roteiro.new
  end

  def create
    @roteiro = Roteiro.new(roteiro_params)
    @roteiro.user_id = current_user
    @roteiro.book_id = params[:book_id]
    if @roteiro.save
      redirect_to roteiro_path(@roteiro)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @roteiro.update(roteiro_params)
      redirect_to roteiro_path(@roteiro)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @roteiro.destroy
    redirect_to roteiros_path
  end

  def update_rating
    @roteiro.rating = params[:rating]
    if @roteiro.save
      redirect_to roteiro_path(@roteiro)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_roteiro
    @roteiro = Roteiro.find(params[:id])
  end

  def roteiro_params
    params.require(:roteiro).permit(:description, :location, :rating, :title, :activity_description,
                                    :activity_address, :estimated_time, :estimated_costs, :activity_done,
                                    :book_id, :user_id)
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
