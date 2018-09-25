FactoryBot.define do
  factory :prescriber do
    prescriber_name {Faker::Name.name}
  end
end 
