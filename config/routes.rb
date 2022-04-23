Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :'api' do
    namespace :'v1' do
      resources :projects
      resources :student_projects
    end  
  end 
   resources :students, param: :_username



  # get ' ', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'


  post "/login", to: "sessions#login"
  post "/signup", to: "sessions#signup"

end
