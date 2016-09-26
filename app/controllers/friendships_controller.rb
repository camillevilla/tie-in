class FriendshipsController < ApplicationController
		def index
		@friends = User.find(params[:id]).friends

		@json = @friends.map do |friend|
      	{
        	id: friend.id,
      		first_name: friend.first_name,
        	last_name: friend.last_name,
        	email: friend.email,
      	}
    end
    render :json => @json
  end
end
