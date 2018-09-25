require 'rails_helper'

RSpec.describe Drug, type: :model do

  describe 'Relations' do
    it {is_expected.to have_many(:medications)}
  end

  describe 'Drug' do
    let!(:drug) {FactoryBot.create(:drug)}
    it 'should be able to be created with a name and id' do
      expect(Drug.count).to eq(1)
      expect(Drug.first.name).to eq(drug.name)
    end
  end

end
