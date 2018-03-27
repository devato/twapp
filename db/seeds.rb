# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
Topic.where({ name: 'Healthcare', active: true }).first_or_create
Topic.where({ name: 'Nasa', active: true }).first_or_create
Topic.where({ name: 'Open Source', active: true }).first_or_create

# Queue the tweet fetcher
FetchTweetsWorker.perform_async
