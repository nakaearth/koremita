# == Schema Information
#
# Table name: api_tokens
#
#  id          :integer          not null, primary key
#  acces_token :string(255)
#  user_id     :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_api_tokens_on_user_id  (user_id)
#

class ApiToken < ActiveRecord::Base
end
