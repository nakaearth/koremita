#require 'groonga'

module Searchable
  extend ActiveSupport::Concern
  included do
  end

  def self.add(path = "/tmp/koremita.db", table_name, key, search_value)
    Groonga::Database.new(path)
    search_model = Groonga[table_name]
    search_model.add(key, title: search_value)
  end

  module ClassMethods
    def search(path = "/tmp/koremita.db", table_name, search_value)
      Groonga::Database.new(path)
      search_model = Groonga[table_name]
      # TODO 検索方式どうするか検討すること
      #      @result = search_model.select { |record| record.title =~ search_value }
    end
  end
end
