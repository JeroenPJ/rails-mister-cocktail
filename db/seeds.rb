require 'json'
require 'open-uri'

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
html = open(url)
json = JSON.load(html)

json["drinks"].each do |drink|
  Ingredient.create(name: drink["strIngredient1"]) unless drink["strIngredient1"] == ""
end
