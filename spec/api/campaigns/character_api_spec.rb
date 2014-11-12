require 'rails_helper'

describe Campaigns::CharacterApi do

  it 'Lists Campaign Characters' do
    campaign = create(:campaign)
    character = create(:character, campaign: campaign)
    create(:character, campaign: campaign)
    get "/campaigns/#{campaign.id}/characters", {}, auth_header
    data = JSON.parse(response.body)
    expect(data.count).to eq(2)
    expect(response.body).to include(character.name)
  end
end
