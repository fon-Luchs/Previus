require 'rails_helper'

RSpec.describe Api::ProfilesController, type: :controller do
  describe '#create.json' do
    let(:user) { stub_model User }

    let(:topic) { stub_model Topic }

    let(:discussion) { stub_model Discussion }

    let(:params) do
      { discussion: { comment: 'test', user_id: user.id, topic_id: topic.id } }
    end

    let(:permitted_params) { permit_params! params, :discussion }

    before do
      expect(Discussion).to receive(:new).with(params).and_return(discussion)
    end

    context 'success' do
      before { expect(discussion).to receive(:save).and_return(true) }

      before { post :create, params: params, format: :json }

      it { should render_template :create }

      it { expect(response).to eq('lol') }
    end
  end

  describe 'discussion routes' do
  end
end
