class FriendshipsController < ApplicationController
		def index
      @user = User.find(params[:id])
      @user_friends = @user.friends
    end

    def create
    	@user = current_user
    	@friendship = friendship.new(user_id: @user.id, friend_id: params[:friend].to_i)
    	if @friendship.save
    		redirect_to "users/:id/friendships"
  		else 
  			@errors = @trip.errors.full_messages
  			render 'new'
  		end
  	end
end
