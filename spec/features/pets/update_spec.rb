require 'rails_helper'

RSpec.describe "as a user on the pet show page" do
  before(:each) do
  Shelter.destroy_all
  Pet.destroy_all
  @shelter1 = Shelter.create!(name: "Mike's Shelter", address: "1331 17th Street", city: "Denver", state: "CO", zip: "80202")

  @pet1 = Pet.create!(image: "https://www.k9web.com/wp-content/uploads/2019/03/Corgi-Husky-Mix-4.jpg",
    name: "Athena",
    description: "butthead",
    age: "1",
    sex: "female",
    status: "adoptable",
    shelter_id: @shelter1.id)
  end

  it "sees a link to update the pet information" do
    visit "/pets/#{@pet1.id}"

    click_link "Update Pet"
    expect(current_path).to eq("/pets/#{@pet1.id}/edit")

    fill_in :name, with: "Gandalf the White"

    click_on "Update Pet"

    expect(current_path).to eq("/pets/#{@pet1.id}")
    expect(page).to have_content("Gandalf the White")
    expect(page).to_not have_content("Athena")
  end
end
