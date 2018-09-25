module Api
  module V1
    module Drugs
      class DrugsController < ApiController

        def index
          render json: Drug.all
        end

        def show
          render json: Drug.find(params[:id])
        end

        def drugs_prescribed_number_of_times
          render json: Prescription.drugs_prescribed_number_of_times
        end

      end
    end
  end
end
