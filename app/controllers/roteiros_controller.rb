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
