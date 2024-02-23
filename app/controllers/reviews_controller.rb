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
