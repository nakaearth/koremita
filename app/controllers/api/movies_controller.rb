module Api
  class MoviesController < ApplicationController
    def index
      # 映画一覧を返す。同じように友達の映画も返すように別途APIを作成する
      friends = FacebookGraph.new(current_user.facebook_provider.token).current_user_friends
      friends.shuffle!
      @movies = []
      friends[0..3].each do |friend_uid|
        user = AuthProvider.find_by(uid: friend_uid).user
        @movies <<  user.movies
      end
    end
  end
end
