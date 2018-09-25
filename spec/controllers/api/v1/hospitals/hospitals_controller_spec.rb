require 'rails_helper'


RSpec.describe Api::V1::Hospitals::HospitalsController, type: :controller do

  describe 'Get #index' do
    it 'returns all hospitals' do

      5.times {FactoryBot.create(:hospital)}
      get :index, format: :json

      hospital = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(hospital.count).to eq(5)
    end
  end

  describe 'Get #show' do
    it 'returns status 200' do

      hospital = FactoryBot.create(:hospital, hospital_name: "Ziba")
      5.times {FactoryBot.create(:hospital)}
      get :show, params: {id: hospital.id},  format: :json

      hospital_name = JSON.parse(response.body)
      expect(hospital_name.values[1]).to eq("Ziba")
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end
  end

  describe 'Get #total_scripts_per_hospital' do
    let!(:hospital1) {FactoryBot.create(:hospital, hospital_name: "Ziba")}
    it'returns response status 200' do
      3.times {FactoryBot.create(:prescription, hospital: hospital1)}
      2.times{FactoryBot.create(:prescription)}

      get :total_scripts_per_hospital, format: :json
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"
    end
  end

end
