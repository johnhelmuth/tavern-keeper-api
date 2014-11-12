class CharacterApi < Grape::API

  helpers do
    def set_model
      @model ||= ::Character.find(params[:character_id]) if params[:character_id].present?
      @model ||= ::Character.new(params[:character]) if params[:character].present?
    end

    def set_collection
      @collection ||= ::Character._public
    end
  end

  get do
    @collection = @collection.page(page)
    present @collection.to_a, with: Characters::ListEntity
  end

  get ':character_id' do
    present @model, with: Characters::ShowEntity
  end
end
