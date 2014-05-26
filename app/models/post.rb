# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  user_id    :integer
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#  post_date  :datetime
#

class Post < ActiveRecord::Base
  before_create :set_post_date

  extend FriendlyId
  friendly_id :post_date_slug, use: :slugged

  # Associations
  belongs_to :user
  # has_many :categories
  has_many :comments, dependent: :destroy

  # Validation macros
  validates :title, presence: true
  validates :content, presence: true

  private

  def set_post_date
    self.post_date = Time.now
  end

  def post_date_slug
    set_post_date.strftime('%Y-%m-%d') + '-' + title.downcase
  end
end
