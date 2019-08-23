class Api::V1::UsersController < ApplicationController 
    def create
        user = User.new(user_params)
        if user.save!
            render json: user_params
        else
            render :new 
        end
    end

    def user_params
        params.permit(:id, :name)
    end
end
