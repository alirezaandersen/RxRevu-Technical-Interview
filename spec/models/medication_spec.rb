require 'rails_helper'

RSpec.describe Medication, type: :model do

  describe 'Realtions' do
    it {is_expected.to belong_to(:drug)}
    it {is_expected.to have_many(:prescriptions)}
  end

  describe 'most common medication ordreed to treat each case' do
    let!(:disease1) {FactoryBot.create(:disease, name: "Gout")}
    let!(:disease2) {FactoryBot.create(:disease, name: "Foot Rot")}
    let!(:disease3) {FactoryBot.create(:disease, name: "Walking Zombie Syndrome")}
    let!(:drug1) {FactoryBot.create(:drug, name: "Advil")}
    let!(:drug2) {FactoryBot.create(:drug, name: "Nyquil")}
    let!(:drug3) {FactoryBot.create(:drug, name: "Asprin")}
    let!(:medication1) {FactoryBot.create(:medication, drug: drug1)}
    let!(:medication2) {FactoryBot.create(:medication, drug: drug1)}
    let!(:medication3) {FactoryBot.create(:medication, drug: drug1)}
    let!(:medication4) {FactoryBot.create(:medication, drug: drug2)}
    let!(:medication5) {FactoryBot.create(:medication, drug: drug2)}
    let!(:medication6) {FactoryBot.create(:medication, drug: drug2)}
    let!(:medication7) {FactoryBot.create(:medication, drug: drug2)}
    let!(:medication8) {FactoryBot.create(:medication, drug: drug3)}
    let!(:prescription1) {FactoryBot.create(:prescription, medication: medication1, disease: disease1)}
    let!(:prescription2) {FactoryBot.create(:prescription, medication: medication2, disease: disease1)}
    let!(:prescription3) {FactoryBot.create(:prescription, medication: medication3, disease: disease1)}
    let!(:prescription4) {FactoryBot.create(:prescription, medication: medication4, disease: disease1)}
    let!(:prescription5) {FactoryBot.create(:prescription, medication: medication5, disease: disease2)}
    let!(:prescription6) {FactoryBot.create(:prescription, medication: medication6, disease: disease2)}
    let!(:prescription7) {FactoryBot.create(:prescription, medication: medication7, disease: disease2)}
    let!(:prescription8) {FactoryBot.create(:prescription, medication: medication7, disease: disease3)}

    it 'will return most common medciation to treat each disease' do
      common = Medication.most_common_medication_ordered_to_treat_each_disease
      expect(common).to eq({"Disease: Gout"=>"Drug: Advil", "Disease: Foot Rot"=>"Drug: Nyquil", "Disease: Walking Zombie Syndrome"=>"Drug: Nyquil"})
    end

  end

end
