FactoryBot.define do
  factory :comment do
    sequence(:content) { |n| "TEST_COMMENT#{n}" }
    association :event
    association :student
  end
end
