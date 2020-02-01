require 'rails_helper'

RSpec.describe "pets show page", type: :feature do
  before do

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

  it "sees the pet based on an id and its information" do
    visit "/pets/#{@pet1.id}"

    expect(page).to have_css("img[src*='#{@pet1.image}']")
    expect(page).to have_content(@pet1.name)
    expect(page).to have_content(@pet1.age)
    expect(page).to have_content(@pet1.sex)
    expect(page).to have_content(@pet1.status)
    expect(page).to_not have_content(@pet2.name)
    expect(page).to_not have_css("img[src*='#{@pet2.image}']")
  end
end
