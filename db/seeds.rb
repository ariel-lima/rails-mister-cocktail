# This file should contain all the record creation needed to seed the database with its default values.
require "json"
require "open-uri"

# rails db:seed command to reupload the Seed files once is changed
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'All Cocktails are being erased from the DataBase..'

Cocktail.destroy_all

sleep(1)

puts 'All Ingredients are being erased from the DataBase..'

Ingredient.destroy_all

sleep(1)

# Fetching from the JSON file to get ingredients
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = URI.open(url).read
ingredient = JSON.parse(ingredient_serialized)

INGREDIENTS = ingredient['drinks']

puts "We are now creating the ingredients..."

sleep(2)

INGREDIENTS.each do |t|
  Ingredient.create(name: "#{t['strIngredient1']}")
end

puts " PERFECT! We have now #{Ingredient.count} Ingredients!"

# Now it is time to make cocktails
# Two options: fetching from the cocktails library or
# doing it manually
# If chosen option 1 (not super sure how to do it)
# https://gist.githubusercontent.com/bensondavies/75a0436fb6bf098b874a06b646aa02d1/raw/90b82062a6b2d574c9530e3612644955bc51da85/cocktail_database.json
# https://www.thecocktaildb.com/api.php

sleep(2)

puts "Creating cocktails..."
margarita = { name: "margarita" }
martini = { name: "martini" }
old_fashioned = { name: "old fashioned" }
negroni = { name: "negroni" }
manhattan = { name: "manhattan" }
daiquiri = { name: "daiquiri" }
cosmopolitan = { name: "cosmopolitan" }
mojito = { name: "mojito" }
bellini = { name: "bellini" }
caipirinha = { name: "caipirinha" }
sazerac = { name: "sazerac" }
screwdriver = { name: "screwdriver" }
sidecar = { name: "sidecar" }
bramble = { name: "bramble" }
derby = { name: "derby" }
eggnog = { name: "eggnog" }
mimosa = { name: "mimosa" }
fizz = { name: "fizz" }
kamikaze = { name: "kamikaze" }
gin_tonic = { name: "gin tonic" }
vodka_tonic = { name: "vodka tonic" }
whiskey_sour = { name: "whiskey sour" }
bloody_mary = { name: "bloody mary" }
mai_tai = { name: "mai tai" }
bourbon_sour = { name: "bourbon sour" }
pina_colada = { name: "pina colada" }
tom_collins = { name: "tom collins" }
cuba_libre = { name: "cuba libre" }
aperol_spritz = { name: "aperol spritz" }
black_russian = { name: "black russian" }
blue_hawaiian = { name: "blue hawaiian" }
champagne_cocktail = { name: "champagne cocktail" }
espresso_martini = { name: "espresso martini" }
cranberry_cooler = { name: "cranberry cooler" }
irish_coffee = { name: "irish coffee" }

[margarita, martini, old_fashioned, negroni, manhattan, daiquiri, cosmopolitan, mojito, bellini, caipirinha, sazerac, screwdriver, sidecar, bramble, derby, eggnog,mimosa, fizz, kamikaze, gin_tonic, vodka_tonic,whiskey_sour, bloody_mary, mai_tai, bourbon_sour, pina_colada,tom_collins, cuba_libre, aperol_spritz, black_russian, blue_hawaiian, champagne_cocktail, espresso_martini, cranberry_cooler, irish_coffee].each do |attributes|
  cocktail = Cocktail.create!(attributes)
  puts "Created #{cocktail.name}"
end
puts "Finished! Now we have #{Cocktail.count} cocktails in the database!"
