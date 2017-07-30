Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "pages#index"

  get "/about", to: "pages#about"

  get "/form", to: "pages#form"

  get "/chat", to: "pages#chat"

  get "/result", to: "pages#result"

  get "/dashboard", to: "pages#dashboard"

  get "/api/questions/finance", to: 'api/questions#finance_show'

  get "/api/questions/escalator", to: 'api/questions#escalator_show'

  get "/api/questions/farm", to: 'api/questions#farm_show'

  get "/api/goals/escalator", to: "api/goals#escalator_show"

end
