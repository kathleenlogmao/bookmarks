class AdDUserId < ActiveRecord::Migration
  def change
    add_column(:categories, :user_id, :integer)
    add_column(:books, :user_id, :integer)
  end
end
