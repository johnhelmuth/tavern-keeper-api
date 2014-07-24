class CampaignApi < Grape::API

  helpers do
    def current_resource
      @model ||= ::Campaign.find(params[:id])
    end
  end

  get do
    @collection = ::Campaign.all.page(page)
    present @collection.to_a, with: Campaigns::ListEntity
  end

  get ':id' do
    present current_resource, with: Campaigns::ShowEntity
  end
end
