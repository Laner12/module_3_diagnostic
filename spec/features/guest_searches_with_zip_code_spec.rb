require "rails_helper"

RSpec.feature "Guest searches with a zip-code" do
  scenario "a guest enters a zip-code and is show the ten closest" do
    visit "/"

    # expect(page).to have_content "Search by zip..."
    expect(page).to have_button "Locate"

    within(".form-inline") do
      fill_in "#q .form-control", with: 80203
      click_button "Locate"
    end

    expect(current_path).to eq("/search")
  end
end
# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
