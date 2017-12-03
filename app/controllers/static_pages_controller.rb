class StaticPagesController < ApplicationController

  def home

  end

  def index
    @flickr_id = static_params[:flickr_id]

    FlickRaw.api_key = Figaro.env.flickr_consumer_key
    FlickRaw.shared_secret = Figaro.env.flickr_secret_key

    # Get list of photos for flickr_id with url to thumbnail (url_t)
    @photos = flickr.people.getPhotos :user_id => @flickr_id, :extras => 'url_t'

  end

  private

    def static_params
      params.require(:flickr).permit(:flickr_id)
    end
end
