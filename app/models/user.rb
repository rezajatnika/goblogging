# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  email            :string(255)      not null
#  crypted_password :string(255)      not null
#  salt             :string(255)      not null
#  first_name       :string(255)
#  last_name        :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!

  # Associations
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Validation macros
  validates :email, presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  validates :first_name, presence: true,
    length: { in: 3..20 }

  validates :last_name, presence: true,
    length: { in: 3..20 }

  validates :password, presence: true,
    confirmation: true,
    on: :create
end
