# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  post_id    :integer
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }

  # Associations
  belongs_to :user
  belongs_to :post

  # Validation macros
  validates :content, presence: true
end
