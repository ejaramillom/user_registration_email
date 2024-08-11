Rails.application.routes.draw do
  post 'registration',  to: 'registrations#create'
end
