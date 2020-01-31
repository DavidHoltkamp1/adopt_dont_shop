Shelter.destroy_all
Pet.destroy_all

@shelter1 = Shelter.create(name: "Mike's Shelter",
                          address: "1331 17th Street",
                          city: "Denver",
                          state: "CO",
                          zip: "80202")

@shelter2 = Shelter.create(name: "Meg's Shelter",
                          address: "150 Main St",
                          city: "Hershey",
                          state: "PA",
                          zip: "17033")

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


# There should be two pets as well, Mike's Shelter has one pet, Athena, 1 year old, female, description: butthead. Meg's Shelter has Odell, 4 years old, M and description: good dog.
#
# You MUST reset and reseed the Heroku database before each time you run this spec harness.
#
# You can run all tests by typing in rspec or you can run them individually by typing in, rspec <filename>
