require 'rails_helper'

RSpec.describe Hospital, type: :model do

  describe 'Relations' do
    it {is_expected.to have_many(:prescriptions)}
    it {is_expected.to have_many(:medications).through(:prescriptions)}
  end

  describe 'Hospital Prescriptions and Hospital drugs' do
    let!(:hospital1) {FactoryBot.create(:hospital, hospital_name: "St Johns")}
    let!(:hospital2) {FactoryBot.create(:hospital, hospital_name: "Anethna")}
    let!(:hospital3) {FactoryBot.create(:hospital, hospital_name: "Ziba")}
    let!(:medication1) {FactoryBot.create(:medication)}
    let!(:medication2) {FactoryBot.create(:medication)}
    let!(:medication3) {FactoryBot.create(:medication)}
    let!(:prescription1) {FactoryBot.create(:prescription, frequency_per_day: 4, days_supply: 30, medication: medication1, hospital: hospital1)}
    let!(:prescription2) {FactoryBot.create(:prescription, frequency_per_day: 4, days_supply: 30, medication: medication1, hospital: hospital1)}
    let!(:prescription3) {FactoryBot.create(:prescription, frequency_per_day: 1, days_supply: 10, medication: medication3, hospital: hospital1)}
    let!(:prescription5) {FactoryBot.create(:prescription, frequency_per_day: 2, days_supply: 90, medication: medication2, hospital: hospital2)}
    let!(:prescription6) {FactoryBot.create(:prescription, frequency_per_day: 2, days_supply: 90, medication: medication2, hospital: hospital2)}
    let!(:prescription7) {FactoryBot.create(:prescription, frequency_per_day: 2, days_supply: 90, medication: medication2, hospital: hospital2)}
    let!(:prescription8) {FactoryBot.create(:prescription, frequency_per_day: 3, days_supply: 10, medication: medication3, hospital: hospital3)}
    let!(:prescription9) {FactoryBot.create(:prescription, frequency_per_day: 3, days_supply: 10, medication: medication3, hospital: hospital3)}
    let!(:prescription10) {FactoryBot.create(:prescription, frequency_per_day: 3, days_supply: 10, medication: medication3, hospital: hospital3)}

    it 'will return most_commonly_prescribed_drug_at_each_hospital' do
      a = Hospital.most_commonly_prescribed_drug_at_each_hospital
      drug_array = []
      Drug.all.each {|drug| drug_array << drug.name }
      expect(a.keys.length).to eq(3)
      expect(a.keys).to eq([hospital1.hospital_name, hospital2.hospital_name, hospital3.hospital_name])
      expect(a.values).to eq(drug_array)
      expect(a.values.length).to eq(3)
    end

    it 'will return total_perscriptions_per_hospital' do
      total = Hospital.total_perscriptions_per_hospital
      expect(total.keys.length).to eq(3)
    end
  end
end
