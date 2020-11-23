FactoryBot.define do
  factory :comment do
    sequence(:content) { |n| "TEST_COMMENT#{n}" }
  end
end
