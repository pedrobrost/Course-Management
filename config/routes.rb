Rails.application.routes.draw do
  devise_for :users
  resources :courses do
    resources :students, :except => [:show]
    resources :exams do
      member do
        patch :results, to: "exams#change_results"
      end
    end
    member do
      get :results
    end
  end

  root to: "courses#index"
end
