# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DeliveryCostFactor.create({
    service: "Motorbike",
    base_cost: 5,
    jun_to_aug: 0.5,
    sep: 1.5,
    other_months: 1
})
DeliveryCostFactor.create({
    service: "Train",
    base_cost: 10,
    jun_to_aug: 0.8,
    sep: 1.8,
    other_months: 1
})
DeliveryCostFactor.create({
    service: "Aircraft",
    base_cost: 20,
    jun_to_aug: 0.8,
    sep: 2,
    other_months: 1
})