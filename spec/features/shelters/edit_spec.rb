require 'rails_helper'

RSpec.describe "shelter update", type: :feature do
  before do
    @shelter1 = Shelter.create(name: "Mike's Shelter", address: "1331 17th Street", city: "Denver", state: "CO", zip: "80202")
  end
  it "sees a link to update shelter" do
    visit "/shelters/#{@shelter1.id}"

    expect(page).to have_link("Update Shelter")
  end

  it "link navigates to edit page" do
    visit "/shelters/#{@shelter1.id}"
    click_on "Update Shelter"

    expect(current_path).to eq("/shelters/#{@shelter1.id}/edit")

    fill_in :name, with: "Delightful Doggys"
    fill_in :address, with: "123 ashby lane"
    fill_in :city, with: "Aurora"
    fill_in :state, with: "CO"
    fill_in :zip, with: "80244"

    click_on "Update Shelter"

    expect(current_path).to eq("/shelters/#{@shelter1.id}")

    expect(page).to have_content("Delightful Doggys")
  end
end
