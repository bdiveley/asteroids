require "rails_helper"

describe Day do

  before(:each) do
    @day = Day.new("2018-01-04")
    @data = [{"name" => "Asteroid 1", "neo_reference_id" => "12345", "is_potentially_hazardous_asteroid" => true }, {"name" => "Asteroid 2", "neo_reference_id" => "12121", "is_potentially_hazardous_asteroid" => false }]
  end
  it 'exist' do
    expect(@day).to be_a(Day)
  end

  it 'have attributes' do

    expect(@day.day).to eq("2018-01-04")
    expect(@day.asteroids).to eq([])
  end

  it 'can add asteroids' do

    @day.add_asteroids(@data)

    expect(@day.asteroids.count).to eq(2)
    expect(@day.asteroids.first.class).to eq(Asteroid)
  end
  it 'can count the number of dangerous asteroids' do
    @day.add_asteroids(@data)
    total = @day.count_dangerous_asteroids

    expect(total).to eq(1)
  end

  it 'can find all dangerous asteroids' do
    @day.add_asteroids(@data)
    result = @day.worst_asteroids

    expect(result.count).to eq(1)
  end
end
