require 'faker'
I18n.locale = :ja
Faker::Config.locale = :en

tokyo_tech = Category.create(name: "東京工業大学")
tokyo_tech.children.create([{ name: "理学院" }, { name: "工学院" }, { name: "物質理工学院" }, { name: "情報理工学院" }, { name: "生命理工学院" }, { name: "環境・社会理工学院" }])
u_tokyo = Category.create(name: "東京大学")
u_tokyo.children.create([{ name: "文科一類" }, { name: "文化二類" }, { name: "文化三類" }, { name: "理科一類" }, { name: "理科二類" }, { name: "理科三類" }])
