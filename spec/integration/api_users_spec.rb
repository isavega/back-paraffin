require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'API User', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  path '/api/user/{user_id}' do
    get 'Returns the user info' do
      tags 'User'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string

      response '200', 'Success' do
        schema type: :object, items: {
          properties: {
            id: { type: :integer },
            name: { type: :string },
            email: { type: :string }
          }
        }
        let(:user_id) { create(:user).id }
        run_test!
      end

      # response '401', 'Unauthorized', skip_before: true do
      #   schema type: :object, items: {
      #     properties: {
      #       error: { type: :string }
      #     }
      #   }
      #   run_test!
      # end
    end
  end
end
