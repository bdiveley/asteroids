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
  end
end
