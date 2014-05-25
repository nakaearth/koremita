class MovieRegister

  def initialize(current_user)
    @user = current_user
  end

  def regist_movie(input_map) 
    youtub = Youtub.new(title: input_map[:youtub][:title],
                        url: input_map[:youtub][:url])
    unless youtub.save 
      #TODO 例外投げる
    end

    movie = Movie.new(title: input_map[:movie][:title],
                      image_url: input_map[:movie][:image_url],
                      description: input_map[:movie][:description],
                      rate: input_map[:movie][:rate])
    movie.youtub = youtub
    unless movie.save 
      #TODO  例外投げる
    end
    @user.movies << movie
    @user.save
  end
end
