Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/rev_test' => 'hello#rev_test'
  get '/chars_recognize' => 'chars#chars_recognize'
  get '/type_check' => 'hello#type_check'
  get '/weeia' => 'calendar#weeia'
end
