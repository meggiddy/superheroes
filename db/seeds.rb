# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
heroes = [
  { name: 'Kamala Khan', super_name: 'Ms. Marvel' },
  { name: 'Doreen Green', super_name: 'Squirrel Girl' },
  { name: 'Gwen Stacy', super_name: 'Spider-Gwen' }
]

powers = [
  { name: 'super strength', description: 'gives the wielder super-human strengths' },
  { name: 'flight', description: 'gives the wielder the ability to fly through the skies at supersonic speed' }
]

hero_powers = [
  { hero_name: 'Kamala Khan', power_name: 'super strength', strength: 'Strong' },
  { hero_name: 'Kamala Khan', power_name: 'flight', strength: 'Weak' },
  { hero_name: 'Doreen Green', power_name: 'super strength', strength: 'Average' },
  { hero_name: 'Gwen Stacy', power_name: 'flight', strength: 'Strong' }
]

heroes.each { |hero| Hero.create!(hero) }
powers.each { |power| Power.create!(power) }

hero_powers.each do |hero_power|
  hero = Hero.find_by(name: hero_power[:hero_name])
  power = Power.find_by(name: hero_power[:power_name])

  HeroPower.create!(
    hero: hero,
    power: power,
    strength: hero_power[:strength]
  )
end
