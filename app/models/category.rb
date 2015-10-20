class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :books

  belongs_to :user, class_name: "User", foreign_key: "user_id"
end
