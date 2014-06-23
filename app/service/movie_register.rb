class MovieRegister

  def initialize(current_user)
    @user = current_user
  end

  def regist_movie(movie_params, youtub_params)
    ActiveRecord::Base.transaction do
      unless youtub_params.blank?
        youtub = Youtub.new(title: youtub_params[:title],
                            url: youtub_params[:url])
        unless youtub.save 
          #TODO 例外投げる
        end
      end

      movie = Movie.new(title: movie_params[:title],
                        image_url: movie_params[:image_url],
                        description: movie_params[:description],
                        rate: movie_params[:rate])
      movie.youtub = youtub if youtub
      unless movie.save 
        #TODO  例外投げる
      end
      @user.movies << movie
      @user.save!
      movie
    end
  end
end
