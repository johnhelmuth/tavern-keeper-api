FactoryGirl.define do
  factory :user do
    sequence(:name) {|x| "User - #{x}"}
    sequence(:email) {|x| "user-#{x}@test.com"}
    password 'password'
    password_confirmation 'password'
  end
end