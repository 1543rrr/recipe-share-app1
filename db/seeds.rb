User.create!(name:  "山田 太郎",
  email: "sample@example.com",
  password:              "foobar",
  password_confirmation: "foobar")

User.create!(name: "ADmin User",
  email: "admin@example.com",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true)

99.times do |n|
name  = Faker::Name.name
email = "sample-#{n+1}@example.com"
password = "password"
User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password)
end

10.times do |n|
  Dish.create!(name: Faker::Food.dish,
               description: "夏に食べたくなる、涼しい料理です",
               portion: 1.5,
               tips: "ピリッと辛めに味付けするのがオススメ",
               reference: "https://cookpad.com/recipe/2792455",
               required_time: 30,
               popularity: 5,
               cook_memo: "初めて作った割にはうまくできた！"
               user_id: 1)
end