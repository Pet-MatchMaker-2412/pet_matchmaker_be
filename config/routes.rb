Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index] do
        resources :questionnaire_submissions, only: [:create, :index]
        patch "questionnaire_submissions/:id", to: "questionnaire_submissions#update"
      end
      resources :petfinder_animals, only: :index
      resources :questions, only: :index
    end
  end
end
