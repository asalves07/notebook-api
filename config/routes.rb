Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :kinds

  api_version(:module => "v1", :parameter => {:name => "version", :value => "1"}) do
    resources :contacts do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show]
      resource :phones, only: [:show], path: 'relationships/phones'

      resource :phone, only: [:show, :update, :create, :destroy]
      resource :phone, only: [:show, :update, :create, :destroy], path: 'relationships/phones'

      resource :address, only: [:show, :update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
    end
  end

  scope module: 'v2' do
    resources :contacts, :constraints => lambda { |request| request.params[:version] == "2"} do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show]
      resource :phones, only: [:show], path: 'relationships/phones'

      resource :phone, only: [:show, :update, :create, :destroy]
      resource :phone, only: [:show, :update, :create, :destroy], path: 'relationships/phones'

      resource :address, only: [:show, :update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
