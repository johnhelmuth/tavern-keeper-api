# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign_data_store, class: 'Campaign::DataStore' do
    campaign_id 1
    key "MyString"
    value nil
  end
end
