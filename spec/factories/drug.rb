FactoryBot.define do
  factory :drug do
    name {Faker::Cannabis.terpene} #closet thing to medical name
    opioid true
  end
end
