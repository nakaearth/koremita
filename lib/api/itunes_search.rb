require 'itunes-search-api'

module Api
  class ItunesSearch
    def initialize(country , category)
      @country  = country
      @category = category
    end

    def search
      ITunesSearchAPI.search(country:  @country, media:  @category)
    end
  end
end
