class Favorite < ApplicationRecord
  belongs_to :user

  def self.find_by_api_key(value)
    joins(:user).joins("JOIN api_keys ON users.id = api_keys.user_id").where("api_keys.value = ?", value)
  end

end
