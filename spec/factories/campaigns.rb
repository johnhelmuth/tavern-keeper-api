FactoryGirl.define do
  factory :campaign do
    sequence(:name) {|n| "campaign #{n}" }
    permission :_public
    sequence(:content) {|n| "campaign content #{n}" }
    user
  end
end
