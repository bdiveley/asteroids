require 'rails_helper'

feature'user visits the root_path' do
  scenario 'enters a start and end date and click submit' do
    stub_request(:get, "https://api.nasa.gov/neo/rest/v1/feed?api_key=#{ENV["NASA_KEY"]}&end_date=2018-01-07&start_date=2018-01-01").to_return(body: File.read('./spec/fixtures/dates_of_asteroids.json'))

    visit root_path

    fill_in 'start_date', with: "1 January, 2018"
    fill_in 'end_date', with: "7 January, 2018"

    click_button "Determine Most Dangerous Day"

    expect(current_path).to eq('/most_dangerous_day')
    expect(page).to have_content("Most Dangerous Day")

    expect(page).to have_content("January 1, 2018 - January 7, 2018")

    within('.result') do
      expect(page).to have_content('January 1, 2018')
      expect(page).to have_css('.asteroid', count: 3)
      expect(page).to have_content('Name: (2014 KT76)')
      expect(page).to have_content('NEO Reference ID: 3672906')
      expect(page).to have_content('Name: (2001 LD)')
      expect(page).to have_content('NEO Reference ID: 3078262')
      expect(page).to have_content('Name: (2017 YR1)')
      expect(page).to have_content('NEO Reference ID: 3794979')
    end
  end
end
