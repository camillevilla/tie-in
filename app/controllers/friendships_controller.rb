class FriendshipsController < ApplicationController
	def index
    @user = User.find(params[:id])
		@friends = @user.friends
  end
end
