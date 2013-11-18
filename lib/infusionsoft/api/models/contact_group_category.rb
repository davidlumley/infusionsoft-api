module Infusionsoft
  module Api
    module Model
      class ContactGroupCategory < Infusionsoft::Api::Model::Base

        def fields
          [:Id, :CategoryName, :CategoryDescription]
        end

      end
    end
  end
end