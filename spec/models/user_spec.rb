require 'rails_helper'
 
  describe User do
 
    include TestFactories
 
    describe "#favorited(post)" do

      before do
        @user = create(:user_with_post_and_comment)
        @post = @user.posts.first
        @post2 = associated_post(title: "another title")
      end

      it "returns `nil` if the user has not favorited the post" do
        if @user.favorites.where(post_id: @post.id).first
          favorite.update_attributes(user: @user, post: @post2)
        end
          expect( @user.favorited(@post) ).to eq(nil)
        end
 
      it "returns the appropriate favorite if it exists" do
        favorite = @user.favorites.create(post: @post, user: @user)
        expect( @user.favorited(@post) ).to eql(favorite)
      end

    describe ".top_rated" do
 
     before do
       @user.destroy
       @user1 = create(:user_with_post_and_comment)
       post = @user1.posts.first
       #create(:comment, user: @user1, post: post)
 
       @user2 = create(:user_with_post_and_comment)
       post = @user2.posts.first
       create(:comment, user: @user2, post: @user2.posts.first)
       #2.times { create(:comment, user: @user2, post: post) }
     end
 
     it "returns users ordered by comments + posts" do
       expect( User.top_rated ).to eq([@user2, @user1])
     end
 
     it "stores a `posts_count` on user" do
       users = User.top_rated
       expect( users.first.posts_count ).to eq(1)
     end
 
     it "stores a `comments_count` on user" do
       users = User.top_rated
       expect( users.first.comments_count ).to eq(2)
     end
   end
  end
end