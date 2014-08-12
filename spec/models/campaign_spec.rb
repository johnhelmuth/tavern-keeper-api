require 'rails_helper'

describe Campaign do

  context 'fields' do
    it 'should have a expected fields' do
      api_key = create(:api_key)

      expect(api_key.attributes.include?('secret')).to eq(true)
      expect(api_key.attributes.include?('origins')).to eq(true)
      expect(api_key.attributes.include?('user_id')).to eq(true)
      expect(api_key.attributes.include?('organization_id')).to eq(true)
      expect(api_key.attributes.include?('status')).to eq(true)
    end
  end

end
