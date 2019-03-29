require 'swagger_helper'

describe 'Parking API' do

  path '/api/parkings' do

    post 'Creates a parking' do
      tags 'Parkings'
      consumes 'application/json'
      parameter name: :parking, in: :body, schema: {
          type: :object,
          properties: {
              name: { type: :string },
              addres: { type: :string },
              phone: { type: :integer}
          },
      }

      response '201', 'pet created' do
          run_test!
      end
    end
  end

  path '/api/parkings' do

    get 'Creates a parking' do
      tags 'Parkings'
      consumes 'application/json'
      parameter name: :parking, in: :body, schema: {
          type: :object,
          properties: {
              name: { type: :string },
              addres: { type: :string },
              phone: { type: :integer}
          },
      }

      response '201', 'pet created' do
        run_test!
      end
    end
    end
end

# ######################