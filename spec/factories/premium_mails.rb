FactoryBot.define do
  factory :premium_mail do
    title { "ゲーム大会やります" }
    association :club
  end
end
