require 'rails_helper'


RSpec.describe Api::V1::Prescriptions::PrescriptionsController, type: :controller do

  describe 'Get #index' do
    it 'returns all prescriptions' do

      5.times {FactoryBot.create(:prescription)}
      get :index, format: :json

      prescription = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(prescription.count).to eq(5)
    end
  end

  describe 'Get #show' do
    it 'returns status 200' do

      prescription = FactoryBot.create(:prescription, id:123451)
      5.times {FactoryBot.create(:prescription)}
      get :show, params: {id: prescription.id}, format: :json

      prescription_name = JSON.parse(response.body)
      expect(prescription_name.values.first).to eq(prescription.id)
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end
  end

  describe 'Get #most_commonly_prescribed_drugs_from_all_hospitals' do
    let!(:drug) {FactoryBot.create(:drug, name: "Durantitor")}
    let!(:medication1) {FactoryBot.create(:medication, drug: drug)}
    it 'returns status 200' do
      10.times {FactoryBot.create(:prescription, medication: medication1)}
      5.times {FactoryBot.create(:prescription)}
      get :most_commonly_prescribed_drugs_from_all_hospitals, format: :json
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"
    end
  end

end
