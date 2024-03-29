Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :quizzes
  resources :prompts
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
  post "quizzes/:id/check_answer", to: "quizzes#check_answer", as: "check_answer"
  get "quizzes/:id/reset_quiz_questions", to: "quizzes#reset_quiz_questions", as: "reset_quiz_questions"
  get "quizzes/:id/activate", to: "quizzes#activate", as: "activate_quiz"
  get "quizzes/:id/add_questions", to: "quizzes#add_questions", as: "add_questions_quiz"
  get "quizzes/:id/subscribe", to: "quizzes#subscribe", as: "subscribe"
end
