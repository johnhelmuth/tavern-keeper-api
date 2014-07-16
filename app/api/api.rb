class Api < Grape::API
  format :json
  
  helpers VersionHelper
  helpers AuthenticationHelper
  helpers LoggerHelper
  
  before do 
    authenticate!
  end
  
  get do 
    {version: version}
  end
  
  mount CampaignApi => '/campaigns'
  mount CharacterApi => '/characters'
end