FactoryBot.define do
  factory :prescription do
    frequency_per_day {Faker::Number.within(1..4)}
    days_supply {Faker::Number.within(10..90)}
    association :medication, factory: :medication
    association :prescriber, factory: :prescriber
    association :hospital, factory: :hospital
    association :disease, factory: :disease
  end
end
