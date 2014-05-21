class Post < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :terms
  has_many :categories, through: :terms
  has_many :comments
end
