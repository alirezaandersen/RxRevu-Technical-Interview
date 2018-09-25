module Api
  module V1
    module Diseases
      class DiseasesController < ApiController

        def index # shows all diseases
          render json: Disease.all
        end

        def show #show specific disease based on ID
          render json: Disease.find(params[:id])
        end

      end
    end
  end
end
