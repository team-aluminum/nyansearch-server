Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :shops, only: [:index, :show], defaults: { format: :json }
  get '/get_sound/:direction/:longitude/:latitude' => 'shops#get_sound', defaults: { format: :json }
end
