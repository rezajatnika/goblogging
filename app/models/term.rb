class Term < ActiveRecord::Base
  # Associations
  belongs_to :post
  belongs_to :category
end
