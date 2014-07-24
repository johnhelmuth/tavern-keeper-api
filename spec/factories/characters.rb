FactoryGirl.define do
  factory :character do
    sequence(:name) {|n| "character #{n}" }
    concept 'Some Concept'
    permission_id 1
    quote 'Some quote'
    nickname 'Some Nickname'
    user
    campaign
  end
end