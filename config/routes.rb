Rails.application.routes.draw do
  get '/', :to => 'url#index'
  post '/new', :to => 'url#new'
  get '/:id', :to => 'url#view'
end
