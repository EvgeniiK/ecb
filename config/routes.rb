Rails.application.routes.draw do
  root to: 'index#index'
  post :exchange, to: 'index#exchange'
end
