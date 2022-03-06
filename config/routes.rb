Rails.application.routes.draw do
  devise_for :users
#  get 'furimas/index'
 # get '/new_furima_path', to: 'furimas#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'furimas#index'
  #resources :furimas
  resources :furimas
end
