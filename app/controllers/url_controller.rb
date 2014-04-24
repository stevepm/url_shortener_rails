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
    if params[:stats]
      @url = Url.find(params[:id])
    else
      @url = Url.find(params[:id])
      @url.update_column(:visits, @url.visits+1)
      redirect_to @url.url
    end
  end
end