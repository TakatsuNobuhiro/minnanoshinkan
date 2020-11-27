require 'rails_helper'

RSpec.describe 'Students', type: :request do
  let(:student) { create(:student) }
  describe 'GET /index' do
    it 'returns http success' do
      get '/students'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get student_path(student.id)
      expect(response).to have_http_status(:success)
    end
  end
end
