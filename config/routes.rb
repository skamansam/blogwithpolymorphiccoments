Rails.application.routes.draw do
  devise_for :admins  
    resources :articles do
      resources :comments
    end 
  root to: 'welcome#index'
  
end
