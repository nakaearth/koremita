require 'elasticsearch/persistence'

module Search
  class Connection
    def self.connect
      @repository = Elasticsearch::Persistence::Repository.new do
        # Configure the Elasticsearch client
        client Elasticsearch::Client.new url: ENV['BONSAI_URL'], log: true, reload_connections: true

        # Set a custom index name
        index :koremita_app

        # Set a custom document type
        type :movie

        # Configure the settings and mappings for the Elasticsearch index
        settings number_of_shards: 1 do
          mappings do
            indexes :title, analyzer: 'kuromoji'
            indexes :description, analyzer: 'kuromoji'
          end
        end
      end
      @repository
    end
  end
end
