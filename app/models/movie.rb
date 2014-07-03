# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  view_flag   :integer
#  rate        :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  category    :string(255)
#  photo       :string(255)
#

class Movie < ActiveRecord::Base
  belongs_to :user
  has_one :youtub

  validates :title , presence: true, length: { maximum: 80 }
  validates :description, presence: true, length: { maximum: 500 }

  mount_uploader :photo,  PhotoUploader
end
