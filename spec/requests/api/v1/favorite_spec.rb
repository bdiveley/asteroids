require "rails_helper"

describe "user/favorites" do
  it "can post a favorite asteroid" do

    user = create(:user, id: 1, email: "uncle.jesse@example.com", name: "Jesse Katsopolis")
    api_key = create(:api_key, value: "abc123", id: 1, user: user)
    user.favorites.create(id: 1, neo_reference_id: "2153306")

    post "/api/v1/user/favorites?api_key=#{api_key.value}&neo_reference_id=2021277"

    expect(response).to be_successful
    expect(user.favorites.last.neo_reference_id).to eq("2021277")

    results = JSON.parse(response.body)
    expect(results).to be_a(Hash)

    expect(results["neo_reference_id"]).to eq("2021277")
    expect(results["asteroids"]["name"]).to eq("21277 (1996 TO5)")
    expect(results["asteroids"]["is_potentially_hazardous_asteroid"]).to eq(false)

  end
end
