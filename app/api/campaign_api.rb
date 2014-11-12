class CampaignApi < Grape::API

  helpers do
    def set_model
      @model ||= ::Campaign.find(params[:campaign_id]) if params[:campaign_id].present?
      @model ||= ::Campaign.new(params[:campaign]) if params[:campiagn].present?
    end

    def set_collection
      @collection ||= ::Campaign._public
    end
  end

  get do
    @collection = @collection.page(page)
    present @collection.to_a, with: Campaigns::ListEntity
  end

  get ':campaign_id' do
    present @model, with: Campaigns::ShowEntity
  end

  params do

  end
  post do

  end
end
