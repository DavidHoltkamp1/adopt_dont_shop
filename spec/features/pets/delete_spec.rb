require 'rails_helper'

RSpec.describe "as a user to delete a pet" do
  before(:each) do
    @shelter1 = Shelter.create!(name: "Mike's Shelter", address: "1331 17th Street", city: "Denver", state: "CO", zip: "80202")

    @pet1 = Pet.create!(image: "https://www.k9web.com/wp-content/uploads/2019/03/Corgi-Husky-Mix-4.jpg",
      name: "Athena",
      description: "butthead",
      age: "1",
      sex: "female",
      status: "adoptable",
      shelter_id: @shelter1.id)
  end
  it "sees a link to delete the pet" do
    visit "/pets/#{@pet1.id}"

    click_on "Delete Pet"

    expect(current_path).to eq('/pets')
    expect(page).to_not have_content("Athena")
  end
end
