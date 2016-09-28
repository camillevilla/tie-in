class FriendshipsController < ApplicationController
	skip_before_filter :verify_authenticity_token
		def index
      @user = User.find(params[:id])
      @user_friends = @user.friends
    end

    def create
    	@user = current_user
    	@user_friends = @user.friends
    	@friendship = Friendship.new(user_id: @user.id, friend_id: params[:friend].to_i)
    	if @friendship.save
    		redirect_to "users/:id/friendships"
  		else 
  			@errors = @friendship.errors.full_messages
  			render 'new'
  		end
  	end
end
