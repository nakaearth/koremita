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

require 'spec_helper'

describe User do
 let!(:current_user) { FactoryGirl.create(:current_user) }
 let!(:test_movie1) { FactoryGirl.create(:test_movie, user: current_user) }
 let!(:test_movie2) { FactoryGirl.create(:test_movie, user: current_user) }
 let!(:test_movie3) { FactoryGirl.create(:test_movie, user: current_user) }
 let!(:test_movie4) { FactoryGirl.create(:test_movie, user: current_user) }

  # モデルの定義をチェック
 it { expect have_many(:movies) }
 it { expect validate_presence_of(:email) }
 it { expect validate_presence_of(:password) }
 it { expect validate_presence_of(:provider) }
 it { expect validate_presence_of(:uid) }
 it { expect validate_presence_of(:name) }
 it { expect(current_user.movies.size).to eql(4)  }  

 describe "user モデル属性チェック" do
   context "ログイン後" do
     before do
       @user = current_user
     end
     it "email address" do
       expect(@user.email).to eql('test@gmail.com') 
     end
     it "password check" do
       expect(@user.password).to eql('test1234')
     end
   end
 end
end
