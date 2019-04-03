require 'swagger_helper'#listo

describe 'vehicle API' do

  path '/api/vehicles' do

    post 'Crear un vehiculo' do
      tags 'vehicles'
      consumes 'application/json'
      parameter name: :rates, in: :body, schema: {
          type: :object,
          properties: {
              plate: { type: :string },
              parking_id: { type: :integer}
          },
      }

      response '201', 'vehicle created' do
        run_test!
      end
    end
  end

  path '/api/vehicles' do

    get 'Mostrar vehicles' do
      tags 'vehicles'
      produces 'application/json'

      response '200', 'vehicles created' do
        run_test!
      end
      response '404', 'vehicles not found' do
        run_test!
      end
    end
  end


  path '/api/vehicles/{id}' do

    delete 'Remove a vehicles' do
      tags 'vehicles'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'vehicles remove' do
        run_test!
      end
      response '404', 'vehicles not found' do
        run_test!
      end
    end
  end

  path '/api/vehicles/{id}' do

    put 'Editar un vehicle' do
      tags 'vehicles'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :string
      parameter name: :vehicles, in: :body, schema: {
          type: :object,
          properties: {
              plate: { type: :string },
              parking_id: { type: :integer}
          },
          required: ['plate','parking_id']
      }
      response '201', 'vehicle editado' do
        run_test!
      end
    end
  end


  path '/api/vehicles/panking_by_plate/{plate}' do

    get 'Buscar vehiculos por la placa' do
      tags 'vehicles'
      produces 'application/json'
      parameter name: :plate, :in => :path, :type => :string

      response '200', 'parametros encontrados' do
        run_test!
      end
      response '404', 'no se encontraron los parametros' do
        run_test!
      end
    end
  end
end

# ###