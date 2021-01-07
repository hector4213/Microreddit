# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

posts = Post.create([{ title: 'Some title', url: 'www.google.com', user_id: 1 }, { title: 'Another one', url: 'www.wedabest.com/we', user_id: 1 },
                     { title: 'A new hope', url: 'www.starwars.com/galaxy/destroy', user_id: 1 }, { title: 'Rails is cool', url: 'www.rubyorg.com/gems', user_id: 1 }, { title: 'Some title again', url: 'www.bing.com', user_id: 1 }, { title: 'I just cant stop typing', url: 'www.myfingershurt.com', user_id: 1 }])
