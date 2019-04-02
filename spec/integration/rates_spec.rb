require 'swagger_helper'#listo

describe 'rate API' do

  path '/api/rates' do

    post 'Crear una tarifa' do
      tags 'rates'
      consumes 'application/json'
      parameter name: :rates, in: :body, schema: {
          type: :object,
          properties: {
              name: { type: :string },
              value: { type: :integer },
              date_begin: { type: :date},
              date_end: { type: :date}
          },
      }

      response '201', 'rate created' do
        run_test!
      end
    end
  end

  path '/api/rates' do

    get 'Mostrar rates' do
      tags 'rates'
      produces 'application/json'

      response '200', 'parking created' do
        run_test!
      end
      response '404', 'parking not found' do
        run_test!
      end
    end
  end


  path '/api/rates/{id}' do

    delete 'Remove a rate' do
      tags 'rates'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'rate remove' do
        run_test!
      end
      response '404', 'rate not found' do
        run_test!
      end
    end
  end

  path '/api/rates/{id}' do

    put 'Editar una entrada' do
      tags 'rates'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :string
      parameter name: :rates, in: :body, schema: {
          type: :object,
          properties: {
              name: { type: :string },
              value: { type: :integer },
              date_begin: { type: :date},
              date_end: { type: :date}
          },
          required: ['name', 'velue', 'date_begin', 'date_end']
      }
      response '201', 'rates editada' do
        run_test!
      end
    end
  end
end
# ###