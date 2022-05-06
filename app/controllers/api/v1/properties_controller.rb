module Api
    module V1
      class PropertiesController < ApiController
        def index
          @properties = Property.all
        end
      end
    end
  end