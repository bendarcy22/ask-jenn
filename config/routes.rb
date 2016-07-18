Rails.application.routes.draw do
  post 'notifications/notify' => 'notifications#notify'
  post 'twilio/voice' => 'twilio#voice'
  root 'questions#index'
  resources :questions, only: [:index, :show, :new, :create]
end
