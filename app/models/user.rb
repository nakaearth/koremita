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
#  has_many :auth_providers

  validates :provider, presence: true 
  validates :name, presence: true 
  validates :uid, presence: true 

  def self.find_for_facebook_oauth(auth)
    @user = User.find_by(provider: auth.provider, uid: auth.uid)
    
    unless user
      @user = User.create( name:     auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         token:    auth.credentials.token,
                         password: Devise.friendly_token[0,20] )
    end
    @user
  end
end
