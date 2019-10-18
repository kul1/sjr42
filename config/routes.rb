Rails.application.routes.draw do
    # config/routes.rb
    Rails.application.routes.draw do
        resources :sjrs, only: [:new, :create]
    end
end
