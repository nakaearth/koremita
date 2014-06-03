# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :movies
  has_many :youtubs
  has_many :auth_providers

  validates :email, presence: true , format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :name, presence: true
end
