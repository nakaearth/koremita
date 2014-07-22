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
  has_many :movies
  has_many :youtubs
  has_many :auth_providers
  has_many :my_comments, ->(record) { where(user_id: record.id) }, class_name: Comment

  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :name, presence: true

  def self.find_by_email_and_provider(params)
    User.includes(:auth_providers).where("users.email" => params[:email]).find_by("auth_providers.provider" => params[:provider])
  end
end
