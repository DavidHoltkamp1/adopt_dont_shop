require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  before do
    @shelter1 = Shelter.create(name: "Mike's Shelter", address: "1331 17th Street", city: "Denver", state: "CO", zip: "80202")
    @shelter2 = Shelter.create(name: "Meg's Shelter", address: "150 Main St", city: "Hershey", state: "PA", zip: "17033")
  end

  it "can show all shelters in system" do
    visit "/shelters"

    expect(page).to have_content(@shelter1.name)
    expect(page).to have_content(@shelter2.name)
  end
end
