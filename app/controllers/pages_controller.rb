class PagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.where(user_id: current_user.id)
    @books = Book.where(user_id: current_user.id)
  
    @book = Book.new
    @category = Category.new

    if params[:q].present?
      @q = params[:q]
      @books = @books.where("lower(title) LIKE :q", q: "%#{@q}%")
    end
  end

  def book_params 
    params.require(:book).permit!
  end
  def category_params 
    params.require(:category).permit!
  end
end