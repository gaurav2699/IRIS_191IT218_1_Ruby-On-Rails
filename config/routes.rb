Rails.application.routes.draw do
  resources :books do
   member do
    patch :update_requested_by
    patch :update_requested
    patch :update_status_approved
    patch :update_status_rejected
    patch :return
  end
end
  devise_for :users, controllers: {
registrations: 'registrations'
 }
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match 'books/:id/mybooks'=>'books#mybooks',:as => :mybooks, via: :get
  match 'books/:id/requests'=>'books#requests',:as => :requests, via: :get
  match 'books/:id/myrequests'=>'books#myrequests',:as => :myrequests, via: :get
  match 'books/:id/approved'=>'books#approved',:as => :approved, via: :get
  match 'books/:id/rejected'=>'books#rejected',:as => :rejected, via: :get
  root to: 'books#index'
end
