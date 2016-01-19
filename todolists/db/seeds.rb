# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

User.create! [
    { username: "Fiorina", password_digest: "password", profile_attributes: { first_name: 'Carly', last_name: 'Fiorina', birth_year: 1954, gender: 'female' }},
        { username: "Trump", password_digest: "password", profile_attributes: { first_name: 'Donald', last_name: 'Trump', birth_year: 1946, gender: 'male' } },
    { username: "Carson", password_digest: "password", profile_attributes: { first_name: 'Ben', last_name: 'Carson', birth_year: 1951, gender: 'male' } },
        { username: "Clinton", password_digest: "password", profile_attributes: { first_name: 'Hillary', last_name: 'Clinton', birth_year: 1947, gender: 'female' } }
]

User.all.each do |user|
    #puts user.todo_lists
    user.todo_lists.create!  [ { list_name: 'my list', list_due_date: (Date.today + 1.year) } ] 
end

TodoList.all.each do |tdl|
    tdl.todo_items.create! [ { due_date: Date.today + 1.year , title: 'item 1', description: 'testing' },{ due_date: Date.today + 1.year , title: 'item 2', description: 'testing' },{ due_date: Date.today + 1.year , title: 'item 3', description: 'testing' },{ due_date: Date.today + 1.year , title: 'item 4', description: 'testing' },{ due_date: Date.today + 1.year , title: 'item 5', description: 'testing' } ]
end

