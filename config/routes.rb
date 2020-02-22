Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#You can have the root of your site routed with "root"
root 'posts#index', as: 'home'


#Example of regular route its a get request
get 'about' => 'pages#about', as: 'about'
#go to pages controller about view

#Claim routes by resource, Example resource route (maps HTTP verbs to controller actions)
resources :posts do
  resources :comments
end
#nest comments inside post because we want it to go /posts/1/comments

end
