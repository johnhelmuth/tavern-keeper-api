require 'rails_helper'

describe 'Api Root' do

  it 'Shows the version and the envionrment' do
    get '/', {}, auth_header
    expect(response.body).to include('- test')
  end

end