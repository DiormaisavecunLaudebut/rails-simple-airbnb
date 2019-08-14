# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
require 'nokogiri'

url = "https://unsplash.com/search/photos/house"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
array = []
html_doc.search('._2zEKz').each do |element|
  link = element.attribute('src').value unless element.attribute('src').nil?
  array << link
end

array.each do |url|
  flat = Flat.new(
    url: url,
    name: Faker::Books::Dune.planet,
    address: Faker::Address.street_address,
    description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad unde cumque a corrupti possimus eius, qui at! Placeat, eum facere accusamus quod debitis doloribus. Tenetur pariatur at quis possimus optio! Lorem ipsum dolor sit amet, consectetur adipisicing elit. At veniam dicta aliquam corrupti ullam error porro reiciendis magni, nostrum, accusantium, ipsa recusandae! Deleniti sapiente voluptatum ullam provident, doloremque, quidem quibusdam.',
    price_per_night: (50...200).to_a.sample,
    number_of_guests: (1...5).to_a.sample
    )
  flat.save
end
