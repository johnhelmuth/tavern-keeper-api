FactoryGirl.define do
  factory :character do
    sequence(:name) {|n| "character #{n}" }
    concept 'Some Concept'
    permission :_public
    quote 'Some quote'
    nickname 'Some Nickname'
    user
    campaign
  end
end
