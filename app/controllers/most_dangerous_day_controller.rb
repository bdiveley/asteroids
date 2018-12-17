class MostDangerousDayController < ApplicationController
  def index
    @facade = DangerousFacade.new(params)
  end

end
