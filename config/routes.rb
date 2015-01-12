Rails.application.routes.draw do

  devise_for :users
  
  root :to => "home#index"
  get 'project_overview', to: 'home#project_overview'

end
