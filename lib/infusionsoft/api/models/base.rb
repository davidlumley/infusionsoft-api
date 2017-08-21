module Infusionsoft
  module Api
    module Model
      class Base

        def initialize(client, model_name)
          @client     = client
          @model_name = model_name || 'Base'
        end

        def all(query = {}, paginate = true, per_page = 1000, page_number = 0)
          per_page = [per_page, 1000].min
          results = @client.connection.call('DataService.query', @client.api_key, self.table_name, per_page, page_number, query, self.fields)
          results.length > 0 && paginate ? results + self.all(query, true, page_number + 1) : results
        end

        def find_each(query = {}, paginate = true, per_page = 1000, page_number = 0, &block)
          per_page = [per_page, 1000].min
          results = @client.connection.call('DataService.query', @client.api_key, self.table_name, per_page, page_number, query, self.fields)
          yield results
          return self.find_each(query, true, per_page, page_number + 1, &block) if results.length > 0 && paginate
          true
        end

        def first(query = {})
          self.all(query, false)[0]
        end

        def create(data = {})
          data['Id'] = @client.connection.call('DataService.add', @client.api_key, self.table_name, data)
          data
        end

        def delete(query)
          if query.is_a?(Hash)
            self.all(query).each{|data| self.delete(data['Id'])}
          else
            @client.connection.call('DataService.delete', @client.api_key, self.table_name, query)
          end
        end

        def count(query={})
          @client.connection.call('DataService.count', @client.api_key, self.table_name, query)
        end

        def table_name
          @model_name
        end

        def fields
          []
        end

      end
    end
  end
end