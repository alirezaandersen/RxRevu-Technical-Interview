Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :diseases, only: [:index, :show], module: 'diseases' do
      end

      resources :hospitals, only: [:index, :show], module: 'hospitals' do
        collection do
          get'/total_scripts_per_hospital', to: 'hospitals#total_scripts_per_hospital'
          get '/most_commonly_prescribed_drug_at_each_hospital', to: 'hospitals#most_commonly_prescribed_drug_at_each_hospital'
        end
      end


    end
  end
end
