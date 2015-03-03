require 'faker'
 
 # Create Posts
 5.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end

if (Post.find_by title: 'Another idiotic Post') == nil
 Post.create!(
  title: "Another idiotic Post",
  body: "judas is traitor!"
   )
end 





 posts = Post.all
 
 # Create Comments
 10.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

 if (Comment.find_by body: "Dont be a hero!") == nil
 Comment.create!(
  #post: post,
  body: "Dont be a hero!"
   )
end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
