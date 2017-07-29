Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "pages#index"

  get "/about", to: "pages#about"

  get "/api/questions/finance", to: 'api/questions#finance_show'

end
