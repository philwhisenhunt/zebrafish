Rails.application.routes.draw do
  resources :quizzes
  resources :prompts
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "quizzes/:id/check_answer", to: "quizzes#check_answer", as: "check_answer"
end
