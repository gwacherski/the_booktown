class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @review = Review.new
  end

  def new
    @book = Book.new
  end

  def create
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
# 1 Preenchimento manual, mas verificar a integração com API do Google Books na hora de criar o livro (buscando os dados,
#   ou através de sugestões a partir do título do livro)
# 1 Link para foto da capa do livro ou upload de foto?
# 1 Sistema de favoritar livros (link entre livro e usuário)
# 2 Em books, ordenação os roteiros por rating ou por data de criação
