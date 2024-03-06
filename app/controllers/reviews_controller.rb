class ReviewsController < ApplicationController

  def index
    @reviews = Review.where(user_id: current_user.id).order(created_at: :desc)
    #mostra as reviews criadas pelo usuário logado
  end

  def show
    #mostra as reviews para todos os usuários. em show#book uma prévia, podendo ir para outra página para um review completo?
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    puts review_params
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.roteiro_id = params[:roteiro_id]

    # @review.pending_approval = true # Set the review as pending approval

    book = Book.find(params[:book_id])

    if @review.save!
      redirect_to book_path(book)
    else
      alert('Erro ao criar review')
      render :new #aqui vai ser o javascript abrindo e fechando a DIV de create renew, pop up de "aguardando review do admin?"
    end
  end

  def edit
  end

  def update
    @review = Review.find(params[:id])

    if current_user.admin? || current_user.id == @review.user_id
      if @review.update(review_params)
        redirect_to book_path
      else
        render :edit
      end
    else
      redirect_to book_path, alert: 'You are not authorized to update this review.'
    end
  end

  def destroy
    @review = Review.find(params[:id])

    if current_user.id == @review.user_id
      @review.destroy
      redirect_to book_path
   end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description, :book_id, :user_id, :roteiro_id)
  end
end

# FEATURES PARA SEREM IMPLEMENTADAS (Número na frente da feature é a prioridade)
# 1 Basico (create, show, edit, update, destroy) - OK
# 1 Como usuário, posso dar uma nota para o review de outras pessoas - sitema de rating 0 a 5 por exemplo - #0 A 5 VEM DIRETO DA GEM # - OK
# 1 Upload de foto no review (limitar quantidade de fotos por review talvez) - OK
# 1 Administrador: Edita e deleta reviews de qualquer usuário, Usuário: Edita e deleta apenas suas próprias reviews - OK
# 2 ordenação dos reviews por rating ou por data
# 2 Aprovação de review pelo admin (ou não) - verificar possibilidade. Criar um campo de status da aprovação do reviews
#   no DB
# 2 Mostrar data que o review foi editado (created_at e updated_at) - # APENAS SHOW, JÁ VEM PRONTO. #





#retu
