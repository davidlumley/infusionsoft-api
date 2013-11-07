module Infusionsoft
  module Api
    module Model
      class Contact < Infusionsoft::Api::Model::Base

        def fields
          [:Id, :FirstName, :LastName, :Company, :Email]
        end

      end
    end
  end
end