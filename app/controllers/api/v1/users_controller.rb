class Api::V1::UsersController < ApplicationController
    def index 
        users = User.all 
        render json: UserSerializer.new(users).to_serialized_json
    end
end
