FactoryGirl.define do
  factory :campaign do
    sequence(:name) {|n| "campaign #{n}" }
    permission_id 1
    sequence(:content) {|n| "campaign content #{n}" }
    user
  end
end