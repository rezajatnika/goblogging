# == Schema Information
#
# Table name: terms
#
#  id          :integer          not null, primary key
#  post_id     :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Term < ActiveRecord::Base
  # Associations
  # belongs_to :post
  # belongs_to :category
end
