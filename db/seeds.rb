require 'faker'
I18n.locale = :ja
Faker::Config.locale = :en
15.times do
  student =
    Student.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: 'hugahuga',
      gender: 1,
      university: '東京工業大学',
      highschool: '広尾学園',
      detail: '私は' + Faker::Food.dish + 'が好きです。'
    )
  student.avatar.attach(
    io: File.open(Rails.root.join('db/seed_images/avatar.jpeg')),
    filename: 'avatar.jpeg'
  )
end

15.times do
  club =
    Student.create(
      name: 'fake',
      email: Faker::Internet.email,
      password: 'hugahuga',
      intercollege: true,
      university: '東京工業大学',
      active: true,
      detail: '毎週火曜日にやってます。'
    )
  club.avatar.attach(
    io: File.open(Rails.root.join('db/seed_images/tech.jpeg')),
    filename: 'tech.jpeg'
  )
end
