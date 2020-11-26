FactoryBot.define do
  factory :tag do
    sequence(:name) { |n| "#{n}工大" }
  end
end
