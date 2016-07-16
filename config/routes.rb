Rails.application.routes.draw do
  post 'notifications/notify' => 'notifications#notify'
  post 'twilio/voice' => 'twilio#voice'
  resources :questions, only: [:index, :show, :new, :create]
end
