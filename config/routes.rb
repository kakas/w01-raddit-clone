Rails.application.routes.draw do

  resources :links do
    resources :comments
  end

  root 'links#index'
end
