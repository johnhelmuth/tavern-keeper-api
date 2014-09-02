class CampaignApi < Grape::API

  helpers do
    def set_model
      @model ||= params[:id] ? ::Campaign.find(params[:id]) : ::Campaign.new(params[:campaign])
    end

    def set_collection
      @collection ||= ::Campaign.all
    end
  end

  get do
    set_collection
    @collection = @collection.page(page)
    present @collection.to_a, with: Campaigns::ListEntity
  end

  get ':id' do
    present @model, with: Campaigns::ShowEntity
  end
end
