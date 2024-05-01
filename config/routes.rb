Rails.application.routes.draw do
  resources :job_posts
  #devise_for :users                                                            
  root 'job_posts#index'
end

