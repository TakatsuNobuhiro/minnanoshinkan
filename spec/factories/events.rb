FactoryBot.define do
  factory :event do
    sequence(:id) { |n| n }
    title { 'ゲーム大会やります！' }
    start { '2020-11-24 07:16:00' }
    sequence(:end, '2020-11-24 07:17:00')
    association :club
  end
end
