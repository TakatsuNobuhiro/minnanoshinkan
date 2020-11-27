require 'rails_helper'

RSpec.describe 'Events', type: :request do
  before { @club = create(:club) }
  let(:event) { create(:event) }
  describe 'GET /index' do
    it 'returns http success' do
      get '/events'
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET /show' do
    it 'returns http success' do
      get event_path(event.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    context 'login なし' do
      it 'redirect to session path' do
        get '/events/new'
        expect(response).to redirect_to new_club_session_path
      end
    end

    context 'login あり' do
      it 'sucess' do
        sign_in @club
        get '/events/new'
        expect(response).to have_http_status(:success)
      end
    end
  end
  # describe 'create' do
  #   context 'login user'
  #   before { sign_in @club }
  #   it 'イベントをひとつ投稿するとひとつ増える' do
  #     event_params = FactoryBot.attributes_for(:event)
  #     expect { post :create, params: { event: event_params } }.to change(
  #       @club.events,
  #       :count
  #     ).by(1)
  #   end
  # end
  describe 'GET /edit' do
    context 'login なし' do
      it 'redirect to session path' do
        get edit_event_path(event.id)
        expect(response).to redirect_to new_club_session_path
      end
    end
    context 'login あり' do
      it 'returns http success' do
        sign_in @club
        get edit_event_path(event.id)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
