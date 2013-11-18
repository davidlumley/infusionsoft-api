module Infusionsoft
  module Api
    module Model
      class ContactGroup < Infusionsoft::Api::Model::Base

        def fields
          [:'Id', :'GroupName', :'GroupCategoryId', :'GroupDescription']
        end

      end
    end
  end
end