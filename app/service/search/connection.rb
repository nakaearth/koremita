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
        type :movie_search

        # Specify the class to inicialize when deserializing documents
        klass SearchMovie

        # Configure the settings and mappings for the Elasticsearch index
        settings number_of_shards: 1 do
          mapping do
            indexes :text, analyzer: 'kuromoji'
          end
        end

        # Customize the serialization logic
        def serialize(document)
          super.merge(my_special_key: 'my_special_stuff')
        end

        # Customize the de-serialization logic
        def deserialize(document)
          super
        end
      end
      @repository
    end
  end
end
