require 'rails_helper'


RSpec.describe Api::V1::Prescribers::PrescribersController, type: :controller do

  describe 'Get #index' do
    it 'returns all prescribers' do

      5.times {FactoryBot.create(:prescriber)}
      get :index, format: :json

      prescriber = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(prescriber.count).to eq(5)
    end
  end

  describe 'Get #show' do
    it 'returns status 200' do

      prescriber = FactoryBot.create(:prescriber, prescriber_name: "Ziba")
      5.times {FactoryBot.create(:prescriber)}
      get :show, params: {id: prescriber.id},  format: :json

      prescriber_name = JSON.parse(response.body)
      expect(prescriber_name.values[1]).to eq("Ziba")
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end
  end

  describe 'Get #effective_doses' do
    let!(:prescriber1) {FactoryBot.create(:prescriber, prescriber_name: "Ziba")}
    let!(:prescriber2) {FactoryBot.create(:prescriber, prescriber_name: "Ali")}
    let!(:medication1) {FactoryBot.create(:medication)}
    let!(:medication2) {FactoryBot.create(:medication)}
    it'returns response status 200' do
      3.times {FactoryBot.create(:prescription, frequency_per_day: 4, days_supply: 90, medication: medication1, prescriber: prescriber1)}
      2.times {FactoryBot.create(:prescription, frequency_per_day: 4, days_supply: 90, medication: medication2, prescriber: prescriber2)}

      get :effective_doses, format: :json
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"
    end
  end

end
