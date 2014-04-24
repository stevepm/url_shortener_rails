class UrlController < ApplicationController
  def index

  end

  def new
    url = Url.new(url: params[:url_to_shorten])
    url.save
    redirect_to "/#{url.id}?stats=true"
    # if url.valid?
    #   url.save
    #   redirect_to "/#{url.id}?stats=true"
    # else
    #   @errors = url.errors.full_messages
    #   render 'welcome/index'
    # end
  end

  def view
    @url = Url.find(params[:id])
    if params[:stats]
    else
      redirect_to @url.url
    end
  end
end