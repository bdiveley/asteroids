require 'rails_helper'

feature'user visits the root_path' do
  scenario 'enters a start and end date and click submit' do

    visit root_path

    fill_in 'start_date', with: "2018-01-01"

    fill_in 'end_date', with: "2018-01-07"

    click_button "Determine Most Dangerous Day"

    expect(current_path).to eq('/most_dangerous_day')

    expect(page).to have_content("Most Dangerous Day")

    expect(page).to have_content("January 1, 2018 - January 7, 2018")

    within('.result') do
      expect(page).to have_content('January 1, 2018')

      expect(page).to have_css('.astroid', count: 3)
      expect(page).to have_content('Name: (2014 KT76)')
      expect(page).to have_content('NEO Reference ID: 3672906')
      expect(page).to have_content('Name: (2001 LD)')
      expect(page).to have_content('NEO Reference ID: 3078262')
      expect(page).to have_content('Name: (2017 YR1)')
      expect(page).to have_content('NEO Reference ID: 3794979')
    end
  end
end
