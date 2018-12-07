class UsersController < ApplicationController

    private def user_params
        params.require(:user).permit(:email, :name, :password)
    end

    private def refresh_token(user)
        user[:token] = Knock::AuthToken.new(payload: { sub: user.id }).token
        if user.save
            user
        else
            nil
        end
    end
  
    def signup
        user = User.new(user_params)
        if user.save
            refresh_token(user)
            render json: UserSerializer.new(user).serialized_json
        else
            render json: { error: user.errors.full_messages }, status: :bad_request
        end
    end

    def signin
        user = User.find_by(email: user_params[:email])
        if !user
            render json: { error: "Not Found" }, status: :not_found
        elsif user.authenticate(user_params[:password])
            refresh_token(user)
            render json: UserSerializer.new(user).serialized_json
        else
            render json: { error: user.errors.full_messages }, status: :bad_request
        end
    end

end
