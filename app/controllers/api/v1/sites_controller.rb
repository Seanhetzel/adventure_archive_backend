class Api::V1::SitesController < ApplicationController
    # def index
    #     endpoint = "https://en.wikipedia.org/w/api.php?"
    #     site = "el Mirador"
    #     params = "action=parse&page=#{site}&format=json"
    #     url = endpoint + params + "&origin=*"
    #     site_html = Nokogiri::HTML(open(url))
    #     puts site_html.content
    # end
    def index 
        sites = Site.all 
        render json: SiteSerializer.new(sites).to_serialized_json
    end
end
