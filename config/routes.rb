Rails.application.routes.draw do
  root "static_pages#home"
  get "/index", to: "static_pages#index"
end
