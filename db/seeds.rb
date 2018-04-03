# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


partners = [
		{name: "Delimobil", adapter_name: "delimobil"},
		{name: "Car5", adapter_name: "car5"},
		{name: "TimCar", adapter_name: "timcar"}
	]

if Partner.first && ENV['RECREATE_PARTNERS'].blank?
  puts "You seem to have some industries already. Run with RECREATE_PARTNERS=true rake db:seed"
else
  Partner.destroy_all
  partners.each do |partner|
    Partner.create partner
  end

  puts "=== CREATED PARTNERS"
end