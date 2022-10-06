require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'API User', type: :request do
  let(:user) { create(:user) }

  before do |response|
    sign_in user unless response.metadata[:skip_before]
  end

  path '/api/user' do
    get 'Returns the user info' do
      tags 'User'
      produces 'application/json'

      response '200', 'Success' do
        schema type: :object, items: {
          properties: {
            id: { type: :integer },
            name: { type: :string },
            email: { type: :string }
          }
        }
        run_test!
      end

      response '401', 'Unauthorized', skip_before: true do
        schema type: :object, items: {
          properties: {
            error: { type: :string }
          }
        }
        run_test!
      end
    end
  end
end
