Rails.application.routes.draw do
  
  # See how all your routes lay out with "rake routes".

  # get 'welcome/index'

  
  resources :articles do
    resources :comments
  end

  root 'welcome#index'
  
end
