class AddCategoryId < ActiveRecord::Migration
  def change
    remove_column(:categories, :book_id)
    add_column(:books, :category_id, :integer)
  end
end
