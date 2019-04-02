require 'swagger_helper'

describe 'Entry API' do


  path '/api/entries' do

    get 'Mostrar entradas' do
      tags 'Entries'
      produces 'application/json'

      response '200', 'Entries visualizada' do
        run_test!
      end
      response '404', 'entries not found' do
        run_test!
      end
    end
  end


  path '/api/entries' do

    post 'Crear una entrada' do
      tags 'Entries'
      consumes 'application/json'
      parameter name: :entry, in: :body, schema: {
          type: :object,
          properties: {
              rate_id: { type: :integer },
              parking_id: { type: :integer },
              vehicle_id: { type: :integer}
          },
      }

      response '201', 'entrada creada' do
        run_test!
      end
    end
  end

  path '/api/entries/{id}' do

    delete 'Remove a entries' do
      tags 'Entries'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'entry remove' do
        run_test!
      end
      response '404', 'entry not found' do
        run_test!
      end
    end
  end

  path '/api/entries/{id}' do

    put 'Editar a entry' do
      tags 'Entries'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :string
      parameter name: :entries, in: :body, schema: {
          type: :object,#:entry_time, :exit_time, :total_time, :price
          properties: {
              rate_id: { type: :integer },
              parking_id: { type: :integer },
              vehicle_id: { type: :integer}
          },
          required: ['rate_id', 'parking_id', 'vehicle_id']
      }
      response '201', 'entrada editada' do
        run_test!
      end
    end
  end


  path '/api/entries/exit_vehicle/{vehicle}' do

    patch 'hora de salida' do
      tags 'Entries'
      produces 'application/json'
      parameter name: :vehicle, :in => :path, :type => :string

      response '200', 'el carro esta saliendo' do
        run_test!
      end
      response '404', 'exit not found' do
        run_test!
      end
    end
  end

  path '/api/entries/show_ticket/{id}' do

    get 'Formato de salida' do
      tags 'Entries'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'echo ' do
        run_test!
      end
      response '404', 'exit not found' do
        run_test!
      end
    end
  end


  path '/api/entries/vehicles_out_side' do

    get 'vehiculos dentro del parqueadero' do
      tags 'Entries'
      produces 'application/json'


      response '200', 'esta dentro del parking' do
        run_test!
      end
      response '404', 'exit not found' do
        run_test!
      end
    end
  end

  path '/api/entries/vehicles_inside' do

    get 'vehiculos fuera del parqueadero' do
      tags 'Entries'
      produces 'application/json'


      response '200', 'esta fuera del parking' do
        run_test!
      end
      response '404', 'exit not found' do
        run_test!
      end
    end
  end




end


# ######################