class AsteroidFacade
  def initialize(data)
    @data = data
    @_search_result = nil
  end

  def one_asteroid
    Asteroid.new(search_result)
  end

private

  def data
    @data
  end

  def service
    NasaService.new(data)
  end

  def search_result
    @_search_result ||= service.find_asteroids_by_neo_id
  end
end
