class UsersController < ApplicationController
  def index
    @users = User.all

    @json = @users.map do |user|
      {
        id: user.id,
        first_name: user.first_name,
        last_name: user.last_name,
        email: user.email,
      }
    end
    render :json => @json
  end
end
