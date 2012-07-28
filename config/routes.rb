CrimeApp::Application.routes.draw do
  
  get "/" => "Crimes#front_page", :as => :front_page
  
  get "/crimes/show_threat" => "Crimes#show_threat", :as => :show_threat

  resources :crimes  
  
  
end
