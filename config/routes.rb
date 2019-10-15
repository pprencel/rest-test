Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/hello' => 'hello#hello'
  get '/chars_recognize' => 'hello#chars_recognize'
  get '/type_check' => 'hello#type_check'
end
