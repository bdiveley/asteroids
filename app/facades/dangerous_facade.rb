class DangerousFacade

  def initialize(data)
    @data = data
    @_search_result = nil
  end

  def display_dates(unformatted_date)
    unformatted_date.to_date.strftime("%B %-d, %Y")
  end

  def api_dates(incoming_date)
    incoming_date.to_date.strftime("%Y-%m-%d")
  end

  def start_date
    display_dates(data["start_date"])
  end

  def end_date
    display_dates(data["end_date"])
  end

  def day_results
    dates = search_result["near_earth_objects"]
    dates.map do |date|
      day = Day.new(date.first)
      day.add_asteroids(date.last)
      day
    end
  end

  def most_dangerous_day
    day_results.max_by do |day|
      day.count_dangerous_asteroids
    end
  end

  def most_dangerous_date
    display_dates(most_dangerous_day.day)
  end

  def dangerous_asteroids
    most_dangerous_day.worst_asteroids
  end

private

  def data
    @data
  end

  def service
    start_date = api_dates(data["start_date"])
    end_date = api_dates(data["end_date"])
    NasaService.new({"start_date" => start_date, "end_date" => end_date})
  end

  def search_result
    @_search_result ||= service.find_asteroids_by_date
  end

end
