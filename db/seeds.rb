# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(
  email: 'test@test.com', 
  user_name: 'Test Account', 
  user: 'A User',
  password: 'test123',
  password_confirmation: 'test123',
)

article = Article.create(
  title: 'First Article!',
  text: 'This is my very first articela nd i hope i don\'t mess it up!'
)

article.comments.create(
  commenter: 'Vistor One <viz1@nowhere.email>',
  body: 'This is a great article!'
)
article.comments.create(
  commenter: 'Vistor Two <viz2@nowhere.email>',
  body: 'Saw this article from /. and thought it was a POS. 10z3R'
)
article.comments.create(
  commenter: 'Vistor One <viz1@nowhere.email>',
  body: 'Forget that guy - it\'s really aweseom!!'
)
