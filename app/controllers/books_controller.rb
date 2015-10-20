class BooksController < ApplicationController
  before_action :authenticate_user!
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @category = Category.new
    @books = Book.where(user_id: current_user.id)
    @categories = Category.where(user_id: current_user.id)

    if @book.save
      redirect_to root_path
    else 
      render "pages/index"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    flash[:success] = "Succesfully Deleted Record."
    @book.destroy
    redirect_to root_path
  end

  def book_params 
    params.require(:book).permit!
  end
end