require 'rails_helper'

describe CharacterApi do

  it 'Lists Characters' do
    campaign = create(:campaign)
    campaign2 = create(:campaign)
    create(:campaign, permission: :_private)
    get '/campaigns', {}, auth_header
    data = JSON.parse(response.body)
    expect(response.body).to include(campaign.name)
    expect(response.body).to include(campaign2.name)
    expect(data.count).to eq(2)
  end

  it 'Shows single campaign' do
    campaign = create(:campaign)
    get "/campaigns/#{campaign.id}", {}, auth_header
    data = JSON.parse(response.body)
    expect(response.body).to include(campaign.name)
    expect(data['name']).to  eq(campaign.name)
  end

end
