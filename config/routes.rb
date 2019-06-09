Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/sound' => 'shops#get_sound', defaults: { format: :json }
end
