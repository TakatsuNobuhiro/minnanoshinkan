FactoryBot.define do
  factory :tag_relationship do
    association :event
    association :tag
  end
end
