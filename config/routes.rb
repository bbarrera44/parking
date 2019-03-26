Rails.application.routes.draw do
  namespace :api do
    get 'entry/all'
    get 'vehicle/all'
    get 'parking/all'
    get 'rate/all'

  resources :rates, only: %i[index create update show destroy] do
  end
  resources :entries, only: %i[index create update show destroy] do
    collection do
      patch "exit_vehicle/:vehicle_id", action: :exit_vehicle
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
