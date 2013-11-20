module Infusionsoft
  module Api
    module Model
      class ContactGroupAssign < Infusionsoft::Api::Model::Base

        def all(query = {}, paginate = true, page_number = 0)
          results = super(query, paginate, page_number)
          results.map{|x|{
            'Id'           => x['ContactId'],
            'FirstName'    => x['Contact.FirstName'],
            'LastName'     => x['Contact.LastName'],
            'Company'      => x['Contact.Company'],
            'Email'        => x['Contact.Email'],
            'ContactGroup' => x['ContactGroup'],
          }}
        end

        def fields
          [:'ContactGroup', :'ContactId', :'Contact.FirstName', :'Contact.LastName', :'Contact.Company', :'Contact.Email']
        end

      end
    end
  end
end