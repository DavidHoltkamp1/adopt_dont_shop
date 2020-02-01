require 'rails_helper'

RSpec.describe "as a user" do
  describe "visit pets index page" do
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

    it "can see each pet in the system" do
      visit '/pets'

      expect(page).to have_css("img[src*='#{@pet1.image}']")
      expect(page).to have_content(@pet1.name)
      expect(page).to have_content(@pet1.age)
      expect(page).to have_content(@pet1.sex)
      expect(page).to have_content(@pet1.shelter.name)

      expect(page).to have_css("img[src*='#{@pet2.image}']")
      expect(page).to have_content(@pet2.name)
      expect(page).to have_content(@pet2.age)
      expect(page).to have_content(@pet2.sex)
      expect(page).to have_content(@pet2.shelter.name)
    end

    it "can see each pet for a particular shelter" do
      visit "/shelters/#{@shelter1.id}/pets"

      expect(page).to have_css("img[src*='#{@pet1.image}']")
      expect(page).to have_content(@pet1.name)
      expect(page).to have_content(@pet1.age)
      expect(page).to have_content(@pet1.sex)
    end
  end
end
