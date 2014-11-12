class Api < Grape::API
  format :json

  helpers VersionHelper
  helpers AuthenticationHelper
  helpers LoggerHelper
  helpers PaginationHelper
  helpers PermissionsHelper


  helpers do
    def set_model
      raise NotImplementedError.new('API must have set_model helper.')
    end
    def set_collection
      raise NotImplementedError.new('API must have set_collection helper.')
    end
  end

  before do
    authenticate!
    if params[:route_info].route_path != '/(.:format)'
      set_model
      set_collection if @model.nil?
      allow?
    end
  end

  after do
    set_page_headers
  end

  get do
    {version: version}
  end

  mount CampaignApi => '/campaigns'
  mount Campaigns::CharacterApi => '/campaigns/:campaign_id/characters'
  mount CharacterApi => '/characters'
end
