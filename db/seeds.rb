Shelter.destroy_all

shelter1 = Shelter.create(name: "Mike's Shelter", address: "1331 17th Street", city: "Denver", state: "CO", zip: "80202")
shelter2 = Shelter.create(name: "Meg's Shelter", address: "150 Main St", city: "Hershey", state: "PA", zip: "17033")


# There should be two pets as well, Mike's Shelter has one pet, Athena, 1 year old, female, description: butthead. Meg's Shelter has Odell, 4 years old, M and description: good dog.
#
# You MUST reset and reseed the Heroku database before each time you run this spec harness.
#
# You can run all tests by typing in rspec or you can run them individually by typing in, rspec <filename>
