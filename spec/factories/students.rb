FactoryBot.define do
  factory :student do
    sequence(:name) { |n| "TestUser#{n}" }
    sequence(:email) { |n| "Test#{n}@example.com" }
    password = Faker::Internet.password(8)
    password { password }
    password_confirmation { password }
    confirmed_at { Date.today }
    gender { 1 }
    university { '東京工業大学' }
    department { '生命理工学部' }
    prefecture { 4 }
  end
end
