require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  it "can create a new shelter" do
    visit "/shelters"
    click_on "New Shelter"


    # expect(current_path).to eq(shelters_new_path)
    expect(current_path).to eq("/shelters/new")

    fill_in :name, with: "Davids Doggys"
    fill_in :address, with: "1234 ashby lane"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: "80211"

    click_on "Create Shelter"

    expect(current_path).to eq("/shelters")
    # expect(current_path).to eq(shelters_path)
    expect(page).to have_content("Davids Doggys")
  end
end
