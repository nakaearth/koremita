module Api
  class FriendsMovieCrowler
    def get_items(url)
      @items = Hypermicrodata.get_items url
    end
  end
end

crowler = Api::FriendsMovieCrowler.new
crowler.get_items('http://localhost:3000')
