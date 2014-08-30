# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :character_datum, :class => 'Character::Data' do
    character_id 1
    key "MyString"
    value ""
  end
end
