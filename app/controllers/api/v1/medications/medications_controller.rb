module Api
  module V1
    module Medications
      class MedicationsController < ApiController

        def index
          render json: Medication.all
        end

        def show
          render json: Medication.find(params[:id])
        end

        def common_medication_for_each_disease
          render json: Medication.most_common_medication_ordered_to_treat_each_disease
        end

      end
    end
  end
end
