class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :neo_reference_id, :user_id

  attribute :asteroids do |object|
    facade = AsteroidFacade.new({"reference_id" => object.object.neo_reference_id}).one_asteroid
    {
      "name": facade.name,
      "is_potentially_hazardous_asteroid": facade.is_potentially_hazardous_asteroid,
    }
  end
end
