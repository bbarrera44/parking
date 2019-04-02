require 'swagger_helper'#listo

describe 'Parking API' do

  path '/api/parkings' do

    post 'Crear un parqueadero' do
      tags 'Parkings'
      consumes 'application/json'
      parameter name: :parkings, in: :body, schema: {
          type: :object,
          properties: {
              name: { type: :string },
              adress: { type: :string },
              phone: { type: :integer}
          },
      }

      response '201', 'parking created' do
          run_test!
      end
    end
  end

  path '/api/parkings' do

    get 'Mostrar parqueaderos' do
      tags 'Parkings'
      produces 'application/json'

      response '200', 'parking created' do
        run_test!
        end
      response '404', 'parking not found' do
        run_test!
      end
    end
  end


  path '/api/parkings/{id}' do

    delete 'Remove a parking' do
      tags 'Parkings'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'parking remove' do
        run_test!
      end
      response '404', 'parking not found' do
        run_test!
      end
    end
  end

  path '/api/parkings/{id}' do

    put 'Editar a parking' do
      tags 'Parkings'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :string
      parameter name: :parkings, in: :body, schema: {
          type: :object,
          properties: {
              name: { type: :string },
              adress: { type: :string },
              phone: { type: :integer}
          },
          required: ['name', 'adress', 'phone']
      }
      response '201', 'parking created' do
        run_test!
      end
    end
  end

  path '/api/parkings/find_parking_by_name/{name}' do

    get 'Buscar nombre de parking' do
      tags 'Parkings'
      produces 'application/json'
      parameter name: :name, :in => :path, :type => :string

      response '200', 'parking remove' do
        run_test!
      end
      response '404', 'parking not found' do
        run_test!
      end
    end
  end

end


# ######################