module Infusionsoft
  module Api
    module Model
      class ContactGroup < Infusionsoft::Api::Model::Base

        def all(query = {}, page_number = 0)
          results = super(query, page_number)
          results.map{|x|{
            'FirstName'    => x['Contact.FirstName'],
            'LastName'     => x['Contact.LastName'],
            'Company'      => x['Contact.Company'],
            'Email'        => x['Contact.Email'],
            'ContactGroup' => x['ContactGroup'],
          }}
        end

        def table_name
          'ContactGroupAssign'
        end

        def fields
          [:'ContactGroup', :'Contact.FirstName', :'Contact.LastName', :'Contact.Company', :'Contact.Email']
        end

      end
    end
  end
end