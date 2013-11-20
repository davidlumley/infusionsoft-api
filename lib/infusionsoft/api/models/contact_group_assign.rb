module Infusionsoft
  module Api
    module Model
      class ContactGroupAssign < Infusionsoft::Api::Model::Base

        def all(query = {}, paginate = true, page_number = 0)
          results = super(query, paginate, page_number)
          results.map{|x|{
            'Id'           => x['ContactId'],
            'GroupId'      => x['GroupId'],
            'FirstName'    => x['Contact.FirstName'],
            'LastName'     => x['Contact.LastName'],
            'Company'      => x['Contact.Company'],
            'Email'        => x['Contact.Email'],
            'ContactGroup' => x['ContactGroup'],
          }}
        end

        def create(data = {})
          data = standardise_query(data)
          @client.connection.call('ContactService.addToGroup', @client.api_key, data[:ContactId], data[:GroupId])
        end

        def delete(query = {})
          query = standardise_query(query)
          if query[:ContactId] && query[:GroupId]
            @client.connection.call('ContactService.removeFromGroup', @client.api_key, query[:ContactId], query[:GroupId])
          else
            self.all(query).each do |data|
              self.delete({
                :ContactId => data['Id'],
                :GroupId   => data['GroupId'],
              })
            end
          end
        end

        def fields
          [:'ContactGroup', :'ContactId', :'GroupId', :'Contact.FirstName', :'Contact.LastName', :'Contact.Company', :'Contact.Email']
        end

        private

        def standardise_query(query = {})
          if query['ContactId'] && query['GroupId']
            query[:ContactId] = query['ContactId']
            query[:GroupId]   = query['GroupId']
          end
          query
        end

      end
    end
  end
end