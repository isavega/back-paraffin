require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'ApiLearningUnits', type: :request do
  let(:user) { create(:user) }
  let(:curriculum_id) { create(:curriculum).id }
  let(:learning_unit_id) { create(:learning_unit).id }
  let(:completed_learning_unit) { create(:completed_learning_unit) }
  let(:resource) { create(:resource, user:) }
  let(:resource_id) { create(:resource).id }
  let(:resource_comment) { create(:resource_comment, resource:, user:) }

  before do |response|
    sign_in user unless response.metadata[:skip_before]
  end

  # GET

  # All Learning Units
  path '/api/curriculums/{curriculum_id}/learning_units' do
    get 'Returns a list of all learning units' do
      tags 'Learning Units'
      produces 'application/json'
      parameter name: :curriculum_id, in: :path, type: :string

      response '200', 'Success' do
        schema type: :array, items: {
          properties: {
            id: { type: :integer },
            name: { type: :string },
            description: { type: :string },
            completed: { type: :boolean }
          }
        }
        run_test!
      end

      response '401', 'Unauthorized', skip_before: true do
        run_test!
      end

      context 'when there are no learning units created' do
        before do |example|
          submit_request(example.metadata)
        end

        it 'returns an empty array' do
          data = JSON.parse(response.body)
          expect(data.length).to eq(0)
        end
      end
    end
  end

  # A specific Learning Unit
  path '/api/curriculums/{curriculum_id}/learning_units/{learning_unit_id}' do
    get 'Returns one learning unit by its id' do
      tags 'Learning Units'
      produces 'application/json'
      parameter name: :curriculum_id, in: :path, type: :string
      parameter name: :learning_unit_id, in: :path, type: :string

      response '200', 'Success' do
        schema type: :object, properties: {
          'id': { type: :integer },
          'name': { type: :string },
          'description': { type: :string }
        }

        run_test!
      end
    end
  end

  # POST

  # Mark a learning unit as completed
  path '/api/curriculums/{curriculum_id}/learning_units/{learning_unit_id}/completed_learning_unit' do
    post 'Marks a learning unit as completed' do
      tags 'Learning Units'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :curriculum_id, in: :path, type: :string
      parameter name: :learning_unit_id, in: :path, type: :string
      parameter name: :completed_learning_unit, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          learning_unit_id: { type: :integer }
        }
      }

      response '201', 'Created' do
        schema type: :object, properties: {
          completed_learning_unit: { type: :object }
        }
        run_test!
      end
    end
  end
end
