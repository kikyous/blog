Blog::Application.routes.draw do
  devise_for :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root :to => "posts#index"

  resources :posts do
    resources :comments
  end
  get 'posts/tag/:tag_name' => 'posts#index'

end
