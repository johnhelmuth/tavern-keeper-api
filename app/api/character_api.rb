class CharacterApi < Grape::API

  get do
    current_resource
  end
end
