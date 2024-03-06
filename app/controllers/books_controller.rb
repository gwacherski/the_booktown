class BooksController < ApplicationController
  def index
    if params[:query].present?
      @books = Book.search_by_name_or_author(params[:query])
      if @books.empty?
        flash[:notice] = "No books found with the name or author: #{params[:query]}"
      else
        @books = Book.search_by_name_or_author(params[:query])
      end
    else
      @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
    @roteiros = @book.roteiros
    @markers = @roteiros.geocoded.map do |roteiro|
      {
        lat: roteiro.latitude,
        lng: roteiro.longitude
      }
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user

    if @book.save
      redirect_to books_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path(@book)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :genre, :year, :price, :quantity, :photo, :descricao)
  end

  def order_params
    params.require(:order).permit(:quantity)
  end
end

# FEATURES PARA SEREM IMPLEMENTADAS (Número na frente da feature é a prioridade)
# 1 Basico (create, show, edit, update, destroy)
# 1 Preenchimento manual, mas verificar a integração com API do Google Books na hora de criar o livro (buscando os dados,
#   ou através de sugestões a partir do título do livro)
# 1 Link para foto da capa do livro ou upload de foto?
# 1 Sistema de favoritar livros (link entre livro e usuário)
# 2 Em books, ordenação os roteiros por rating ou por data de criação
# Colocar parte destinada a dedicatórias
# colocar página de reviews do usuário
