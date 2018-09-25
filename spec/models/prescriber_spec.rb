require 'rails_helper'

RSpec.describe Prescriber, type: :model do

  describe 'Prescriber' do
    it {is_expected.to have_many(:prescriptions)}
  end

  describe 'provider_effective_doses' do
    let!(:prescriber1) {FactoryBot.create(:prescriber, prescriber_name: "Sean")}
    let!(:prescriber2) {FactoryBot.create(:prescriber, prescriber_name: "Ali")}
    let!(:prescriber3) {FactoryBot.create(:prescriber, prescriber_name: "Ziba")}
    let!(:medication1) {FactoryBot.create(:medication)}
    let!(:medication2) {FactoryBot.create(:medication)}
    let!(:medication3) {FactoryBot.create(:medication)}
    let!(:prescription1) {FactoryBot.create(:prescription, frequency_per_day: 4, days_supply: 90, medication: medication1, prescriber: prescriber1)}
    let!(:prescription2) {FactoryBot.create(:prescription, frequency_per_day: 4, days_supply: 90, medication: medication1, prescriber: prescriber1)}
    let!(:prescription3) {FactoryBot.create(:prescription, frequency_per_day: 1, days_supply: 10, medication: medication3, prescriber: prescriber1)}
    let!(:prescription5) {FactoryBot.create(:prescription, frequency_per_day: 2, days_supply: 90, medication: medication2, prescriber: prescriber2)}
    let!(:prescription6) {FactoryBot.create(:prescription, frequency_per_day: 2, days_supply: 90, medication: medication2, prescriber: prescriber2)}
    let!(:prescription7) {FactoryBot.create(:prescription, frequency_per_day: 4, days_supply: 90, medication: medication2, prescriber: prescriber2)}
    let!(:prescription8) {FactoryBot.create(:prescription, frequency_per_day: 3, days_supply: 10, medication: medication3, prescriber: prescriber3)}
    let!(:prescription9) {FactoryBot.create(:prescription, frequency_per_day: 3, days_supply: 10, medication: medication3, prescriber: prescriber3)}
    let!(:prescription10) {FactoryBot.create(:prescription, frequency_per_day: 3, days_supply: 10, medication: medication3, prescriber: prescriber3)}

    it 'return providers top effective doses' do
      dr_script = Prescriber.provider_effective_doses#(frequency="4", days="90")

      expect(dr_script).to eq({"Prescriber: Sean"=>"Higest frequency of effective doses written: 2",
                               "Prescriber: Ali"=>"Higest frequency of effective doses written: 1"})
      expect(dr_script.length).to_not eq(3)
    end
  end
end 
