require 'elasticsearch'

module Search
  class Movie
    def initialize
      @es = Elasticsearch::Client.new hosts: ENV['BONSAI_URL'], reload_connections: true
    end

    # type_nameは例えばmovieとかそういう値
    def index(movie, index_value: ENV['INDEX_NAME'], type_value: 'movie_search')
      @es.index index: index_value, type: type_value,
                id: movie.id, body: { title: movie.title }
    end

    def document(id, index_value: ENV['INDEX_NAME'], type_value: 'movie_search')
      @es.get index: index_value, type: type_value, id: id
    end

    def search(title_query, index_value: ENV['INDEX_NAME'])
      @es.search index: index_value, body: { query: { match: { title: title_query } } }
    end
  end
end
