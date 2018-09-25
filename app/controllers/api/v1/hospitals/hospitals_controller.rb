module Api
  module V1
    module Hospitals
      class HospitalsController < ApiController

        def index #shows all hopsitals
          render json: Hospital.all
        end

        def show #show specific hospital based on id
          render json: Hospital.find(params[:id])
        end

        def total_scripts_per_hospital #shows total scripts writen at each hospital
          render json: Hospital.total_perscriptions_per_hospital
        end

        def most_commonly_prescribed_drug_at_each_hospital #tasks 2 most commonly prescribed drug at each hospital
          render json: Hospital.most_commonly_prescribed_drug_at_each_hospital
        end

      end
    end
  end
end
