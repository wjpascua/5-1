Proj3::Application.routes.draw do
  
  get "user/index"

  get "pages/login"

  get "create_surveys/index"
  
  get "create_surveys/questions"

  get "results/displayChart"
  
  get "create_surveys/doneSurvey"
  
  get "create_surveys/test"

  match "pages/login" => "pages#login", :via => [:get, :post]
  match "create_surveys/index" => "create_surveys#index", :via => [:get, :post]
  match "create_surveys/questions" => "create_surveys#questions"
  match "create_surveys/test" => "create_surveys#test"
  match "create_surveys/doneSurvey" => "create_surveys#doneSurvey"
end
