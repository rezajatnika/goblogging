class Category < ActiveRecord::Base
  # Associations
  has_many :terms
  has_many :posts, through: :terms
end
