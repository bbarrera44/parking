Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    get 'entry/all'
    get 'vehicle/all'
    get 'parking/all'
    get 'rate/all'

  resources :rates, only: %i[index create update show destroy] do
  end
  resources :entries, only: %i[index create update show destroy] do
    collection do
      patch "exit_vehicle/:vehicle", action: :exit_vehicle
      get "show_ticket/:id", action: :show_ticket
      get "vehicles_out_side", action: :vehicles_out_side
      get "vehicles_inside", action: :vehicles_inside
    end
  end
  resources :parkings, only: %i[index create update show destroy] do
    collection do
      get "get_parkings/:name", action: :find_parking_by_name
    end
  end
  resources :vehicles, only: %i[index create update show destroy] do
    collection do
      get 'get_panking_by_name_and_color/:plate/:color', action: :find_vehicle_by_plate
    end
  end


end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
