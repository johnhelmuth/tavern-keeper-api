class Api < Grape::API
  format :json
  
  helpers VersionHelper
  
  get do 
    {version: version}
  end
end