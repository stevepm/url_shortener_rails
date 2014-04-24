class UrlController < ApplicationController

  def initialize
    @errors = []
  end

  def index
  end

  def new
    url = Url.new(url: params[:url_to_shorten])
    if url.save
      redirect_to "/#{url.id}?stats=true"
    else
      @errors = url.errors[:url]
      render 'url/index'
    end
  end

  def view
    id = params[:id]
    @url = Url.find(id)
    if params[:stats]
    else
      Url.increment_counter(:visits, id)
      redirect_to @url.url
    end
  end
end