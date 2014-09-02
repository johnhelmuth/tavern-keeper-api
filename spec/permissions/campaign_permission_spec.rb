require 'rails_helper'

describe CampaignPermission do

  context 'Permission Retrieval' do
    it 'return a permission' do
      p = Permission.for(Campaign, nil, nil)

      expect(p.class).to eq(CampaignPermission)
    end
  end

  context 'Guest Access' do
    it 'should allow index, get' do 
      p = Permission.for(Campaign, nil, nil)
      expect(p.allow?(:index)).to eq(true)
      # expect(p.allow(:get)).to eq(true)
    end

    it 'should not allow create' do
      p = Permission.for(Campaign, nil, nil)
      expect(p.allow?(:post)).to eq(false)
    end
  end

end
