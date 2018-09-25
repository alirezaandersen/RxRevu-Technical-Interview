require 'rails_helper'


RSpec.describe Api::V1::Drugs::DrugsController, type: :controller do

  describe 'Get #index' do
    it 'returns all diseases' do

      5.times {FactoryBot.create(:drug)}
      get :index, format: :json

      drug = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(drug.count).to eq(5)
    end
  end

  describe 'Get #show' do
    it 'returns status 200' do

      5.times {FactoryBot.create(:drug)}
      get :show, params: {id: 1},  format: :json

      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end
  end

  describe 'Get# drugs_prescribed_number_of_times' do
    let!(:drug) {FactoryBot.create(:drug, name: "Durantitor")}
    let!(:medication1) {FactoryBot.create(:medication, drug: drug)}

    it 'response status 200' do

      10.times {FactoryBot.create(:prescription, medication: medication1)}
      5.times {FactoryBot.create(:prescription)}
      get :drugs_prescribed_number_of_times, format: :json

      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"
    end
  end

end
