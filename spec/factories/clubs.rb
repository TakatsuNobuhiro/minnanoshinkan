FactoryBot.define do
  factory :club do
    sequence(:name) { |n| "TestUser#{n}" }
    sequence(:email) { |n| "Test#{n}@example.com" }
    password = 'password'
    password { password }
    password_confirmation { password }
    confirmed_at { Date.today }
    active { true }
    university { '東京工業大学' }
    intercollege { true }
  end
end
