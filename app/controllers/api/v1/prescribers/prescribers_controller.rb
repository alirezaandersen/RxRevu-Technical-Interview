module Api
  module V1
    module Prescribers
      class PrescribersController < ApiController

        def index
          render json: Prescriber.all
        end

        def show
          render json: Prescriber.find(params[:id])
        end

        def effective_doses
          render json: Prescriber.provider_effective_doses#(effective_params)
        end

private
        def effective_params
          #strong param breaking for some reason
          params.permit(:frequency, :days)
        end

      end
    end
  end
end
