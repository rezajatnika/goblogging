class User < ActiveRecord::Base
  authenticates_with_sorcery!

  # Associations
  has_many :posts
  has_many :comments
end
