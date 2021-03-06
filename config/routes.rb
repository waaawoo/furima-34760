Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: %i[new create show edit update destroy] do
    # 情報の紐付けはネストして紐付ける
    resources :buyer_history, only: [:index, :new]
  end

end
