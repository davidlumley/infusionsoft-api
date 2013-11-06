module Infusionsoft
  module Api
    module Model
      class ContactGroup < Infusionsoft::Api::Model::Base

        def table_name
          'ContactGroupAssign'
        end

        def fields
          [:ContactGroup, :'Contact.FirstName', :'Contact.LastName', :'Contact.Company', :'Contact.Email']
        end

      end
    end
  end
end