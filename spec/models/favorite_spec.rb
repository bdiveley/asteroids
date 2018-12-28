require "rails_helper"

describe 'instance_methods' do
  it "returns a list of favorites by api_key" do
    uncle_jesse = User.create!(id: 1, name: "Jesse Katsopolis", email: "uncle.jesse@example.com")
    key = uncle_jesse.create_api_key!(id: 1, value: 'abc123')
    favorite = uncle_jesse.favorites.create!(id: 1, neo_reference_id: "2153306")

      results = Favorite.find_by_api_key(key.value).first

      expect(results.id).to eq(1)
      expect(results.neo_reference_id).to eq("2153306")
      expect(results.id).to eq(1)
  end
end
