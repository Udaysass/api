require 'rails_helper'

describe Api::V1::ProjectsController, type: :controller do
  project = FactoryBot.create(:project)
      # before do
      #   get '/api/v1/projects'
      # end
  context '#index' do 
    it "get all index" do
     project =  FactoryBot.create(:project)
     get :index

      # expect(JSON.parse(response.body)[0]['id']).to eq(project.id)
      assert_response(200)
    end  
  end  


  # context '#show' do 
  #   it "render to show" do
  #    project =  FactoryBot.create(:project)
  #    get :show, params: { id: project.id } 
  #    expect(assigns(:project)).to eq(project)
  #    assert_response(200)
  #   end  

  #   it 'render all status 404' do
  #     get :show, params: { id: '' } 
  #     assert_response(404)
  #   end
  # end  


  # context '#update' do 
  #   it "render to update" do
  #    project =  FactoryBot.create(:project)
  #    get :show, params: { id: project.id } 
  #    expect(assigns(:project)).to eq(project)
  #    assert_response(200)
  #   end  

  #   it 'render all status 404' do
  #     get :show, params: { id: '' } 
  #     assert_response(404)
  #   end
  # end  

  # it 'returns all projects' do
  #   byebug  
  #   expect(json.size).to eq(10)
  # end

  # it 'returns status code 200' do
  #   expect(response).to have_http_status(:success)
  # end
  # end

  context 'with valid parameters' do
    it 'render 404 when project is not exist' do
       patch :update, params: { id: '',  name: 'jack' }
       assert_response(404)
    end
    it 'updates the requested project' do
      project = FactoryBot.create(:project)
      patch :update, params: { id: project.id, name: 'jack' }
      project.reload
      expect(assigns(:project)).to eq(project)  
    end
  end


  # describe 'DELETE /projects/:id' do

  context '#delete' do 
   #  project =  FactoryBot.create(:project)
   #  it 'returns status code 204' do
   #   delete :destroy, params: { id: project.id } 
   #   # expect(response).to have_http_status(204)
   #    expect(response).to have_http_status(:success)
   #   # assert_response(404)
   # end
    it 'returns status code 404' do
      delete :destroy, params: { id: '' } 
      assert_response(404)
    end
  end
end