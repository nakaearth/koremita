module Api
  class MoviesController < ApplicationController
    def index
      # 映画一覧を返す。同じように友達の映画も返すように別途APIを作成する
      frineds = FacebookGraph.new(current_user.facebook_provider.access_token).current_user_friends
      # frinedsからランダムでIDを取得しそれを元にUser.include(:auth_provoder).find_by(uid: uid)
      # 見たいにしてユーザを取得。その後持っている映画情報3件程を取得し返すようにする
      
      @movies = current_user.movies.limit(3)
    end
  end
end
