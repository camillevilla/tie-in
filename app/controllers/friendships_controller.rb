class FriendshipsController < ApplicationController
		def index
      @user = User.find(params[:id])
      @user_friends = @user.friends
    end
end
