Rails.application.routes.draw do
  resources :tab_files, only: [:new, :create]

  root 'tab_files#new'
end
