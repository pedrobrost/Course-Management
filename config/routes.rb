Rails.application.routes.draw do
  resources :courses do
    resources :students
    resources :exams do
      member do
        patch :results, to: "exams#change_results"
      end
    end
  end
end
