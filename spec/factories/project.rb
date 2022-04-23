FactoryBot.define do
  factory :project do
    name { Faker::Lorem.name }
    # description { Faker::Description.description}
    # email { Faker::Lorem.email }
    # password_digest { Faker::Lorem.password_digest }
  end
end