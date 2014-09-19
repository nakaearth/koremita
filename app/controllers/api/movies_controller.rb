module Api
  class MoviesController < ApplicationController
    def index
      # 映画一覧を返す。同じように友達の映画も返すように別途APIを作成する
      friends = FacebookGraph.new(current_user.facebook_provider.access_token).current_user_friends
      friends.shuffle!
      @movies = []
      friends[0..3].each do |friend|
        user = User.include(:auth_provider).find_by(uid: friend.user.uid)
        @movies <<  user.my_movies
      end
      @movies
    end
  end
end
