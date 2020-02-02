require 'rails_helper'

RSpec.describe "create pet from shelter pets index page" do
  before(:each) do
    @shelter1 = Shelter.create(name: "Mike's Shelter", address: "1331 17th Street", city: "Denver", state: "CO", zip: "80202")
    @shelter2 = Shelter.create(name: "Meg's Shelter", address: "150 Main St", city: "Hershey", state: "PA", zip: "17033")

    @pet1 = Pet.create(image: "https://www.k9web.com/wp-content/uploads/2019/03/Corgi-Husky-Mix-4.jpg",
      name: "Athena",
      description: "butthead",
      age: "1",
      sex: "female",
      status: "adoptable",
      shelter_id: @shelter1.id)

    @pet2 = Pet.create(image: "https://i.pinimg.com/originals/56/6b/72/566b72df9eb55d1854a230f96c84d822.png",
      name: "Odell",
      description: "good dog",
      age: "4",
      sex: "male",
      status: "adoptable",
      shelter_id: @shelter2.id)
  end

  it "sees a link to add a new adoptable pet" do
    visit "/shelters/#{@shelter1.id}/pets"

    click_link "Create Pet"

    expect(current_path).to eq("/shelters/#{@shelter1.id}/pets/new")

    fill_in :image, with: "https://bamahuskies.com/wp-content/uploads/2013/07/wolf-grey-husky-puppy-female.jpg"
    fill_in :name, with: "Gandalf"
    fill_in :description, with: "wise puppy"
    fill_in :age, with: "6 months"
    fill_in :sex, with: "male"

    click_button "Create Pet"

    new_pet = Pet.last

    expect(current_path).to eq("/shelters/#{@shelter1.id}/pets")
    expect(page).to have_css("img[src*='#{new_pet.image}']")
    expect(page).to have_content(new_pet.name)
    expect(page).to have_content(new_pet.age)
    expect(page).to have_content(new_pet.sex)
    expect(new_pet.status).to eq("Adoptable")
  end
end
