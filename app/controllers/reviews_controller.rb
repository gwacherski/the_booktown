class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    #show para o usuário ou para o admin? Show de todas as reviews do usuário ou review + nome do book?
  end

  def new
    @review = Review.new
  end

  def create
    #ao criar review -> admin aprove direto?
    #ou review é criada e fica pendente de aprovação?
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
# 1 Como usuário, posso dar uma nota para o review de outras pessoas - sitema de rating 0 a 5 por exemplo
# 1 Upload de foto no review (limitar quantidade de fotos por review talvez)
# 1 Administrador: Edita e deleta reviews de qualquer usuário, Usuário: Edita e deleta apenas suas próprias reviews
# 2 ordenação dos reviews por rating ou por data
# 2 Aprovação de review pelo admin (ou não) - verificar possibilidade. Criar um campo de status da aprovação do reviews
#   no DB
# 2 Mostrar data que o review foi editado (created_at e updated_at)
