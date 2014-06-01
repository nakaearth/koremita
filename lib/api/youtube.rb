require 'youtube_it'

module Api
  class Youtube
    def initialize
      @client = YouTubeIt::Client.new(dev_key: ENV['YOUTUB_DEV_KEY'])
    end

    def search_movie(keyword, page = 1, per_page = 20)
      @videos = @client.videos_by(:query => keyword, page: page, per_page: per_page )
      @videos
    end
  end
end
