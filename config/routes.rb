Rails.application.routes.draw do
  resources :urls, only: [:create, :show], param: :short_url do
    get 'stats'
  end
end
