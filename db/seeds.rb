# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'random_data'

# Create Topics
15.times do
    Topic.create!(
        name:         RandomData.random_sentence,
        description:  RandomData.random_paragraph
    )
end
topics = Topic.all

# Create Posts
50.times do
    Post.create!(
        topic:  topics.sample,
        title:  RandomData.random_sentence,
        body:   RandomData.random_paragraph
    )
end
posts = Post.all

# Create SponsoredPost
25.times do
    SponsoredPost.create!(
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        price: rand(10...50)
    )
end

# Create Comments
100.times do
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
    )
end

100.times do
    Question.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        resolved: false
    )
end

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
