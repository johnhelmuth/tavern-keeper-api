FactoryGirl.define do
  factory :api_key do
    user
    origins ['www.example.com']
  end
end