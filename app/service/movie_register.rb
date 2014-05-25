class MovieRegister

  def initialize(current_user)
    @user = current_user
  end

  def regist_movie(input_map)
    movie = Movie.new(title: input_map[:movie][:title],
                      image_url: input_map[:movie][:image_url],
                      description: input_map[:movie][:description],
                      rate: input_map[:movie][:rate])
    movie.user
    unless movie.save do
      # 例外投げる
    end
    youtub = Youtub.new(title: input_map[:youtub][:title],
                        url: input_map[:youtub][:url])
    youtub.movie = movie
    unless youtub.save do
      # 例外投げる
    end
  end
end
