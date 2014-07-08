require 'itunes-search-api'

module Api
  class ItunesSearch
    def initialize(term, country, category)
      @term     = term
      @country  = country
      @category = category
    end

    def search
      ITunesSearchAPI.search(term: @term, country:  @country, media:  @category)
    end
  end
end
