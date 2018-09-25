require 'rails_helper'


RSpec.describe Api::V1::Diseases::DiseasesController, type: :controller do

  describe 'Get #index' do
    it 'returns all diseases' do

      5.times {FactoryBot.create(:disease)}
      get :index, format: :json

      disease = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(disease.count).to eq(5)
    end
  end

  describe 'Get #show' do
    it 'returns status 200' do

      5.times {FactoryBot.create(:disease)}
      get :show, params: {id: 1},  format: :json

      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end
  end

end
