FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2022-09-28 18:27:18" }
  end
end
