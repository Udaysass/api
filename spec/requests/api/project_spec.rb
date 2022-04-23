require 'swagger_helper'

RSpec.describe 'api/project', type: :request do
	# path '/projects' do

  #   post 'Creates a project' do
  #     tags 'Projects'
  #     consumes 'application/json'
  #     parameter name: :project, in: :path, schema: {
  #       type: :object,
  #       properties: {
  #         name: { type: :string },
  #         description: { type: :string }
  #       },
  #       required: [ 'name', 'description' ]
  #     }

  #     response '201', 'project created' do
  #       let(:project) { { name: 'foo', description: 'bar' } }
  #       run_test!
  #     end

  #     response '422', 'invalid request' do
  #       let(:project) { { name: 'foo' } }
  #       run_test!
  #     end
  #   end
  # end

  	path '/api/v1/projects' do
      post 'create a project ' do
        tags 'Projects'
        produces 'application/json', 'application/xml'
         parameter name: :name, in: :query, type: :string
        parameter name: :description, in: :query, type: :string
        response '200', 'project found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                  name: { type: :string },
                   description: { type: :string }
                 },
                 required: %w[name description]
          # let(:id) { Project.create(name: 'as', description: 'asas') }
          run_test!
        end
        response '404', 'project not found' do
          let(:id) { 'invalid' }
          run_test!
        end
        response '406', 'unsupported accept header' do
          let(:Accept) { 'application' }
          run_test!
        end
      end
    end

  path '/projects/{id}' do

    get 'Retrieves a project' do
      tags 'Projects', 'Another Tag'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'project found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            description: { type: :string }
          },
          required: [ 'id', 'name', 'description' ]

        let(:id) { Project.create(name: 'foo', description: 'bar').id }
        run_test!
      end

      response '404', 'project not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end



