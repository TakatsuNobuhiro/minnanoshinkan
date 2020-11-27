require 'rails_helper'

RSpec.describe 'Clubs', type: :request do
  let(:club) { create(:club) }
  describe 'GET /index' do
    it 'returns http success' do
      get '/clubs'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get club_path(club.id)
      expect(response).to have_http_status(:success)
    end
  end
end
