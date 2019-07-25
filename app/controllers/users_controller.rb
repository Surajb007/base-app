class UsersController < ApplicationController
	def create
		@user = User.new(user_params)
		if @user.save
			render json: {
				jwt: encode_token({id: @user.id, username: @user.username}),
				user: @user
            }
		else
			render json: @user.errors, status: 400
		end
	end

	private
	def user_params
		params.permit(:username, :password)
	end
end
