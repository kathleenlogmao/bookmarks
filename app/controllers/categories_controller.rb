class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id

    @book = Book.new
    @categories = Category.where(user_id: current_user.id)

    if @category.save
      redirect_to root_path
    else 
      render "pages/index"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(category_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    flash[:success] = "Succesfully Deleted Record."
    @category.destroy
    redirect_to root_path
  end
  
  def category_params 
    params.require(:category).permit!
  end
end