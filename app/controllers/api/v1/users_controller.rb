class Api::V1::UsersController < ApplicationController
    def index 
        sites = Site.all 
        render json: SiteSerializer.new(sites).to_serialized_json
    end
end
