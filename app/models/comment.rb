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

  # Associations
  belongs_to :user
  belongs_to :post

  # Law of Demeter
  delegate :first_name, to: :user, prefix: true

  # Validation macros
  validates :content, presence: true
end
