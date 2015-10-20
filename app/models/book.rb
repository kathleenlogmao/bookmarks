class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :link, presence: true, :format => URI::regexp(%w(http https))
  validates :category, presence: true


  belongs_to  :category

  scope :list_of_books, -> { group(:category_id) }

  belongs_to :user, class_name: "User", foreign_key: "user_id"


end

