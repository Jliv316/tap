Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/campaigns/ordered_campaigns", to: "campaigns#ordered_campaigns"
end
