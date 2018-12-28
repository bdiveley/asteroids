class Api::V1::User::FavoritesController < ApiBaseController

  def index
    render json:
     Favorite.find_by_api_key(params[:api_key])
  end

  def create
    new_fave = current_user.favorites.create!({
      neo_reference_id: params[:neo_reference_id]
      })
    render json: Favorite.find(new_fave.id)
  end

end
