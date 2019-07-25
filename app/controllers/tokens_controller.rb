class TokensController < ApplicationController
    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            render json: {
                jwt: encode_token({id: user.id, username: user.username})
            }
        else
            head :not_found
        end
    end
end
