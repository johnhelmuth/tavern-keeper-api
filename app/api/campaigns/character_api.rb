class Campaigns::CharacterApi < Grape::API

  helpers do
    def set_model
      nil
    end
    def set_collection
      @campaign ||= ::Campaign.find(params[:campaign_id])
      @collection ||= @campaign.characters
    end
  end

  get do
    @collection = @collection.page(page)
    present @collection.to_a, with: Characters::ListEntity
  end
end
