require 'rails_helper'
 
  describe User do
 
    include TestFactories

    describe "#favorited(post)" do
      
      before do
        @user = authenticated_user
        @post = associated_post
        @post2 = associated_post(title: "another title")
        #favorite = @post.favorites.create( post: @post, user: @user )
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
    end
  end