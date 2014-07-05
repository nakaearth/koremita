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
          # TODO例外投げる
        end
      end

      movie = @user.movies.build(title: movie_params[:title],
                                 description: movie_params[:description],
                                 rate: movie_params[:rate])

      movie.photo = FileUploader.upload_cloudinary(movie_params[:photo], 'movie',
                                                   movie.title + Time.zone.now.strftime('%Y%m%d%H%M'))

      # movieテーブルに登録
      movie.save!

      unless youtub_params.blank?
        youtub = movie.build_youtub(title: youtub_params[:title],
                                    url: youtub_params[:url])
        youtub.save!
      end

      movie
    end
  end
end
