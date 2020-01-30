RSpec.describe "shelter show page", type: :feature do
  before do
    @shelter1 = Shelter.create(name: "Mike's Shelter", address: "1331 17th Street", city: "Denver", state: "CO", zip: "80202")
    @shelter2 = Shelter.create(name: "Meg's Shelter", address: "150 Main St", city: "Hershey", state: "PA", zip: "17033")
  end

  it "sees a link to delete shelter" do
    visit "/shelters/#{@shelter1.id}"

    expect(page).to have_link("Delete Shelter")
  end
  it "clicks on delete shelter link" do
    visit "/shelters/#{@shelter1.id}"

    click_on "Delete Shelter"

  expect(current_path).to eq("/shelters")
  expect(page).to_not have_content(@shelter1.name)
  end
end
