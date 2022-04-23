FactoryBot.define do
  factory :student do
    name { Faker::Lorem.name }
    # username { Faker::Lorem.username}
    # username  = Faker::UserName.username 
    email { Faker::Internet.email  }
    # password_digest { Faker::Password.password_digest }
    # password_digest = "password"
    # password_digest = BCrypt::Password.create('secret') 
  end
end