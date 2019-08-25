class Api::V1::UsersController < ApplicationController 

    def index 
        user = User.all 
        render json: UserSerializer.new(user).to_serialized_json
    end

    def create
        if User.exists?(name: params[:name])
            user = User.find_by(name: params[:name])
            render json: user_params
        else
            user = User.new(user_params)
            if user.save!
                render json: user_params
            else
                render :new 
            end
        end
    end

    def user_params
        params.require(:user).permit(:id, :name)
    end
end
