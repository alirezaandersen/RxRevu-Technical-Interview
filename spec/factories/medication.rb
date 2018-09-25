FactoryBot.define do
  factory :medication do
    strength 10
    strength_unit "mg"
    form "tablet"
    association :drug, factory: :drug
  end
end
