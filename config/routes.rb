Rails.application.routes.draw do
  resources :moves, only: [:index, :create] do 
    collection do
      delete :reset_board
    end
  end
end
