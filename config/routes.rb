Rails3DeviseRspecCucumber::Application.routes.draw do
  resources :coachee_profiles

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]

  match '/auth/:service/callback' => 'services#create'
  match '/auth/:provider/callback' => 'services#create'
  match '/auth/failure'=> 'services#create'

end
