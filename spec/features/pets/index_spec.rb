require 'rails_helper'

RSpec.describe "as a user", type: :feature do
  describe "visit pets index page" do
    it "can see each pet in the system" do
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
    visit '/pets'

    expect(page).to has_css?(@pet1.image)
    expect(page).to have_content(@pet1.name)
    expect(page).to have_content(@pet1.age)
    expect(page).to have_content(@pet1.sex)
    expect(page).to have_content(@pet1.shelter.name)

    expect(page).to has_css?(@pet2.image)
    expect(page).to have_content(@pet2.name)
    expect(page).to have_content(@pet2.age)
    expect(page).to have_content(@pet2.sex)
    expect(page).to have_content(@pet2.shelter.name)
    end
  end
end
