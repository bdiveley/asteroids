class Asteroid
  attr_reader :name,
              :neo_reference_id,
              :dangerous

  def initialize(data)
    @name = data["name"]
    @neo_reference_id = data["neo_reference_id"]
    @dangerous = data["is_potentially_hazardous_asteroid"]
  end
end
