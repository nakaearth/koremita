require 'elasticsearch'

module Search
  class Movie
    def initialize
      @es = Elasticsearch::Client.new hosts: [ENV['BONSAI_ELASTICSEARCH_HOST']], reload_connections: true
    end

    # type_nameは例えばmovieとかそういう値
    def index(index_value: ENV['INDEX_NAME'], type_value: 'movie_search', movie)
      @es.index index: index_value, type: type_value,
                id: movie.id, body: { title: movie.title }
    end

    def document(index_value: ENV['INDEX_NAME'], type_value: 'movie_search', id)
      @es.get index: index_value, type: type_value, id: id
    end

    def search(index_value: ENV['INDEX_NAME'], title_query)
      @es.search index: index_value, body: { query: { match: { title: title_query } } }
    end
  end
end
