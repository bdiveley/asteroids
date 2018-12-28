require "rails_helper"

describe 'NasaService' do
  it 'exists' do
    service = NasaService.new({start_date: 2018-01-01, end_date: 2018-01-07})

    expect(service).to be_a(NasaService)
  end
  context "instance methods" do
    it "find_asteroids_by_date" do
      VCR.use_cassette("nasa_asteroids_cassette") do
        service = NasaService.new({start_date: 2018-01-01, end_date: 2018-01-07})

        expect(service.find_asteroids_by_date).to be_a(Hash)
      end
    end
    it "find_asteroid_by_favorite_api_key" do
      VCR.use_cassette("one_asteroid_cassette") do
        service = NasaService.new({"reference_id" => "2153306"})
        result = service.find_asteroids_by_neo_id

        expect(result).to be_a(Hash)
        expect(result["name"]).to eq("153306 (2001 JL1)")
        expect(result["neo_reference_id"]).to eq("2153306")
        expect(result["is_potentially_hazardous_asteroid"]).to eq(false)

      end
    end
  end
end
