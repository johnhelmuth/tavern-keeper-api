class Api < Grape::API
  format :json

  helpers VersionHelper
  helpers AuthenticationHelper
  helpers LoggerHelper
  helpers PaginationHelper

  helpers do
    def current_resource
      raise NotImplementedError.new('API Module needs to impliment current resource helper.')
    end
  end

  before do
    authenticate!
  end

  after do
    set_page_headers
  end

  get do
    {version: version}
  end

  mount CampaignApi => '/campaigns'
  mount CharacterApi => '/characters'
end
