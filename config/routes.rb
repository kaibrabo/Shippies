Rails.application.routes.draw do

    resources :advertisements

    resources :questions

    resources :topics do
        resources :posts, except: [:index]
    end

    get 'about' => 'welcome#about'

    root to: 'welcome#index'

end
