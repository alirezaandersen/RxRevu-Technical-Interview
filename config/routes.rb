Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :diseases, only: [:index, :show], module: 'diseases' do
      end

      resources :drugs, only: [:index, :show], module: 'drugs' do
        collection do
          get '/drugs_prescribed_number_of_times', to: 'drugs#drugs_prescribed_number_of_times'
        end
      end

      resources :hospitals, only: [:index, :show], module: 'hospitals' do
        collection do
          get '/total_scripts_per_hospital', to:'hospitals#total_scripts_per_hospital'
          get '/most_commonly_prescribed_drug_at_each_hospital', to: 'hospitals#most_commonly_prescribed_drug_at_each_hospital'
        end
      end

      resources :medications, only: [:index, :show], module: 'medications' do
        collection do
          get '/common_medication_for_each_disease', to: 'medications#common_medication_for_each_disease'
        end
      end

      resources :prescribers, only: [:index, :show], module: 'prescribers' do
        collection do
          get '/effective_doses', to:'prescribers#effective_doses'
          # get '/effective_doses/:frequency/:days', to:'prescribers#effective_doses'
        end
      end

      resources :prescriptions, only: [:index, :show], module: 'prescriptions' do
        collection do
          get '/most_commonly_prescribed_drugs_from_all_hospitals', to: 'prescriptions#most_commonly_prescribed_drugs_from_all_hospitals'
        end

        member do
          get '/find_all_by_medication',  to:'prescriptions#find_all_by_medication'
          get '/find_all_by_presciber',   to:'prescriptions#find_all_by_presciber'
        end
      end

    end
  end

end
