Rails.application.routes.draw do
  resources :courses do
    resources :students
    resources :exams
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
