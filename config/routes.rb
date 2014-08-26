Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :reports, only: [:index] do
      collection do
        get :total_sales_of_each_product
        post :total_sales_of_each_product
      end
    end
  end
end
