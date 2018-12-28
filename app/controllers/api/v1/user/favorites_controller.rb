class Api::V1::User::FavoritesController < ApiBaseController

  def index
    render json:
     Favorite.find_by_api_key(params[:api_key])
  end
end
