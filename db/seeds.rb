10.times do
  User.create!(last_name: Faker::Name.last_name,
              first_name: Faker::Name.first_name,
              email: Faker::Internet.unique.email,
              password: "password",
              password_confirmation: "password")
end

user_ids = User.ids

20.times do |index|
  user = User.find(user_ids.sample)
  user.boards.create!(title: "タイトル#{index}", body: "本文#{index}")
end
