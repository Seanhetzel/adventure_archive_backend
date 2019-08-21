class Api::V1::SitesController < ApplicationController

    def index 
        sites = Site.all 
        render json: SiteSerializer.new(sites).to_serialized_json
    end

    def create
        site = Site.new(site_params)
        if site.save!
            render json: site_params
        else
            render :new 
        end
    end

    def update
        @site = Site.find(params[:id])
        @site.update(site_params)
        render json: site_params
    end

    def destroy
        site = Site.find(params[:id])
        site.delete
    end

    private 

    def site_params
        params.permit(:id, :name, :description)
    end
end
