# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Item.destroy_all
# Item Dummy entries
Item.create([
	{name: "Smart Hub",price: "49.99",active: true},
	{name: "Motion Sensor",price: "24.99",active: true},
	{name: "Wireless Camera",price: "99.99",active: true},
	{name: "Smoke Sensor",price: "19.99",active: true},
	{name: "Water Leak Sensor",price: "14.99",active: true}
])

Promotion.destroy_all
# Promotion Dummy entries
Promotion.create([
    {name: "20%OFF",code: "PERCENT20",reduction:"20",reduction_type:"percent",is_conjunction:false,status:true},
    {name: "5%OFF",code: "PERCENT05",reduction:"5",reduction_type:"percent",is_conjunction:true,status:true},
    {name: "20POUNDSOFF",code: "FLAT20",reduction:"20",reduction_type:"flat",is_conjunction:true,status:true}
])

# Order ststus
OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"