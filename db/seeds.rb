# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

   first_user = User.create(name: 'anne', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
   second_user = User.create(name: 'ariana', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')



  first_post = Post.create(author_id: 32, title: 'Hello', text: 'This is my first post')
  second_post = Post.create(author_id: 33, title: 'Hello', text: 'Text messages are used for personal, family, business and sociahd')
  third_post = Post.create(author_id: 32, title: 'Hello', text: 'Text messages are used for personal, family, business and sociahd')
  fourd_post = Post.create(author_id: 33, title: 'Hello', text: 'Text messages are used for personal, family, business and sociahd')
  five_post = Post.create(author_id: 32, title: 'Hello', text: 'Text messages are used for personal, family, business and sociahd')
  six_post = Post.create(author_id: 33, title: 'Hello', text: 'Text messages are used for personal, family, business and sociahd')



Comment.create(post_id: 56, author_id: 32, text: 'Hi anne!' )
Comment.create(post_id: 57, author_id: 33, text: 'Hi araina!' )
Comment.create(post_id: 55, author_id: 32, text: 'Hi anne!' )
Comment.create(post_id: 53, author_id: 33, text: 'Hi araina!' )


Like.create(post_id: 56, author_id: 32)
Like.create(post_id: 57, author_id: 33)
Like.create(post_id: 55, author_id: 32)
Like.create(post_id: 53, author_id: 33)
