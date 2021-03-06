module Infusionsoft
  module Api
    module Model
      class Base

        def initialize(client, model_name)
          @client     = client
          @model_name = model_name || 'Base'
        end

        def all(query = {}, paginate = true, page_number = 0)
          results = @client.connection.call('DataService.query', @client.api_key, self.table_name, 1000, page_number, query, self.fields)
          results.length > 0 && paginate ? results + self.all(query, true, page_number + 1) : results
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