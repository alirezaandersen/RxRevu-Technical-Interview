require 'rails_helper'

RSpec.describe Prescription, type: :model do

  describe 'Relations' do
    it {is_expected.to belong_to(:prescriber)}
    it {is_expected.to belong_to(:hospital)}
    it {is_expected.to belong_to(:medication)}
    it {is_expected.to belong_to(:disease)}
  end

  describe 'drugs_prescribed_number_of_times' do
    let!(:drug) {FactoryBot.create(:drug, name: "Durantitor")}
    let!(:medication1) {FactoryBot.create(:medication, drug: drug)}

    it 'returns most commonly prescribe drug' do
      10.times {FactoryBot.create(:prescription, medication: medication1)}
      5.times {FactoryBot.create(:prescription)}
      drug = Prescription.drugs_prescribed_number_of_times
      expect(drug.first).to eq(["Drug: Durantitor", "Number of times prescribed: 10"])
      expect(drug.values.first).not_to eq(drug.values.last)
    end
  end

end
