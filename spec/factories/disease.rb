FactoryBot.define do
  factory :disease do
    name {Faker::Science.element}
  end
end
