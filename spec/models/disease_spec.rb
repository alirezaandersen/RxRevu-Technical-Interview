require 'rails_helper'

RSpec.describe Disease, type: :model do

  describe 'Relations' do
    it {is_expected.to have_many(:prescriptions)}
  end

  describe 'Disease' do
    let!(:disease) {FactoryBot.create(:disease)}
    it 'should be able to be created with a name and id' do
      expect(Disease.count).to eq(1)
      expect(Disease.first.name).to eq(disease.name)
    end
  end
end
