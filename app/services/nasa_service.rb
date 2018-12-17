class NasaService

  def initialize(filter)
    @filter = filter
  end

  def find_asteroids_by_date
    JSON.parse(get_json.body, symbolize_name: true)
  end

  private

  def filter
    @filter
  end

  def get_json
    conn.get("/neo/rest/v1/feed?start_date=#{filter["start_date"]}&end_date=#{filter["end_date"]}&api_key=#{ENV['NASA_KEY']}")
  end

  def conn
    Faraday.new(url: 'https://api.nasa.gov')
  end
end
