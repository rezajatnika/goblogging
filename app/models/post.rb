# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  excerpt    :string(255)
#  user_id    :integer
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :terms
  has_many :categories, through: :terms
  has_many :comments
end
