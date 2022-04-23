require 'rails_helper'

describe StudentsController, type: :controller do
  student = FactoryBot.create(:student)
      # before do
      #   get '/api/v1/projects'
      # end
  context '#index' do 
    it "get all index" do
     student =  FactoryBot.create(:student)
     byebug
     get :index
      assert_response(200)
    end  
  end  


  context '#show' do 
    it "render to show" do
     student =  FactoryBot.create(:student)
     get :show, params: { id: student.id } 
     expect(assigns(:student)).to eq(student)
     assert_response(200)
    end  

    it 'render all status 404' do
      get :show, params: { id: '' } 
      assert_response(404)
    end
  end  

  context 'with valid parameters' do
    it 'render 404 when student is not exist' do
       patch :update, params: { id: '',  name: 'john' }
       assert_response(404)
    end
    it 'updates the requested student' do
      student = FactoryBot.create(:student)
      patch :update, params: { id: student.id, name: 'jack' }
      project.reload
      expect(assigns(:student)).to eq(student)  
    end
  end


  context '#delete' do 
   #  student =  FactoryBot.create(:student)
   #  it 'returns status code 204' do
   #   delete :destroy, params: { id: student.id } 
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