class FriendshipsController < ApplicationController

	skip_before_filter :verify_authenticity_token
		def index
      @user = User.find(params[:user_id])
      @user_friends = @user.friends
    end

    def find
      @user = User.find(params[:user_id])
      @friend_email = params[:email]
      if @friend_email.empty?
        @errors = ["Email cannot be blank"]
        render 'index'
      else
        @friend = User.find_by(email: @friend_email)
        if @friend
          render 'find'
        else
          render 'invite'
        end
      end
    end

    def mail
      @user = User.find(params[:user_id])
      @email = params[:email]
    end

    def new
      @user = User.find(params[:user_id])
      @users = User.all
      @user_friends = @user.friends
    end

    def create
    	@user = current_user
      @friend_id = params[:friend].to_i
    	@user_friends = @user.friends
      if @user.id == @friend_id || @user_friends.include?(User.find(@friend_id))
        @errors = ["Friendship already exists"]
        render 'index'
      else
      	@friendship1 = Friendship.new(user_id: @user.id, friend_id: @friend_id)
        @friendship2 = Friendship.new(user_id: @friend_id, friend_id: @user.id)

        if @friendship1.save && @friendship2.save
      		redirect_to "users/#{@user.id}/friendships"
    		else
    			@errors = @friendship1.errors.full_messages + @friendship2.errors.full_messages
    			render 'index'
    		end
      end
  	end

end
