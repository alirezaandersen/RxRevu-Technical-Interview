module Api
  module V1
    module Prescriptions
      class PrescriptionsController < ApiController

        def index #show all hospitals
          render json:  Prescription.all
        end

        def show #show specific hospital based on id
          render json:  Prescription.find_by(id: params[:id].to_i)
        end

        def find_all_by_medication
          render json: Prescription.where(medication_id: params[:id].to_i)
        end

        def find_all_by_presciber
          render json: Prescription.where(prescriber_id: params[:id].to_i)
        end

        def most_commonly_prescribed_drugs_from_all_hospitals
          render json: Prescription.drugs_prescribed_number_of_times
        end

      end
    end
  end
end
