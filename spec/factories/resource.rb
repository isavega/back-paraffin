FactoryBot.define do
  factory :resource do
    name { 'Ruby 101' }
    url { 'https://example.com' }
    description { 'The best Ruby resource' }
    association :user, factory: :user
    association :learning_unit, factory: :learning_unit
  end
end
