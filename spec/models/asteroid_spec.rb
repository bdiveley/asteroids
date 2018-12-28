require "rails_helper"

describe Asteroid do

  before(:all) do
    data = {"name" => "(Asteroid 1)", "neo_reference_id" => "12345", "is_potentially_hazardous_asteroid" => true }
    @asteroid = Asteroid.new(data)
  end
  it 'exist' do
    expect(@asteroid).to be_a(Asteroid)
  end

  it 'has attributes' do
    name = "(Asteroid 1)"
    neo_reference_id = "12345"

    expect(@asteroid.name).to eq(name)
    expect(@asteroid.neo_reference_id).to eq(neo_reference_id)
    expect(@asteroid.is_potentially_hazardous_asteroid).to eq(true)
  end
end
