class CampaignApi < Grape::API

  helpers do
    def set_model
      # @model ||= params[:id] ? ::Campaign.find(params[:id]) : ::Campaign.new(params[:campaign])
      @model ||= ::Campaign.find(params[:campaign_id]) if params[:campaign_id].present?
      @model ||= ::Campaign.new(params[:campaign]) if params[:campiagn].present?
    end

    def set_collection
      @collection ||= ::Campaign.all
    end
  end

  get do
    @collection = @collection.page(page)
    present @collection.to_a, with: Campaigns::ListEntity
  end

  get ':id' do
    present @model, with: Campaigns::ShowEntity
  end
end
