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

      movie = Movie.new(title: movie_params[:title],
                        description: movie_params[:description],
                        rate: movie_params[:rate])
      movie.youtub = youtub if youtub
      
      # 画像アプロード
#      options = { tags: [Rails.env, 'movie'], public_id: movie.title + Time.zone.now.strftime('%Y%m%d%H%M'), image_metadata: false, flags: :force_strip }
#      uploaded_photo = Cloudinary::Uploader.upload(movie_params[:photo], options)
#      movie.photo = uploaded_photo['secure_url']
      movie.photo = FileUploader.upload_cloudinary(movie_params[:photo], 'movie',
                                   movie.title + Time.zone.now.strftime('%Y%m%d%H%M'))
                                 
      # movieテーブルに登録
      unless movie.save
        # TODO例外投げる
      end

      @user.movies << movie
      @user.save!
      movie
    end
  end
end
