require 'rails_helper'

RSpec.describe Api::TopicsController, type: :controller do
  it { should be_a ApplicationController }

  let(:user)   { create(:user, :with_auth_token) }

  let(:topic)  { stub_model Topic }

  let(:forum)  { stub_model Forum }

  let(:params) do
    { topic: { title: 'test title', text: 'test text', forum_id: forum.id } }
  end

  let(:request_params) do
    {
      forum_id: forum.id.to_s,
      id: topic.id.to_s
    }
  end

  let(:permitted_params) { permit_params! params, :topic }

  describe '#create.json' do
    let(:request_params) do
      {
        title: 'test title',
        text: 'test text',
        forum_id: forum.id.to_s,
      }
    end

    before { topic_builder }

    context 'success' do
      before { expect(topic).to receive(:save).and_return(true) }

      before { post :create, format: :json, params: request_params }

      it { should render_template :create }
    end

    context 'fail' do
      before { expect(topic).to receive(:save).and_return(true) }

      before { post :create, format: :json, params: request_params }

      it { should render_template :create }
    end
  end

  describe '#show.json' do
    before { expect(Topic).to receive(:find).with(topic.id).and_return(topic) }

    before { get :show, format: :json, params: request_params }

    it { should render_template :show }
  end

  describe '#update.json' do
    before { topic_builder }

    before { expect(topic).to receive(:update).and_return(true) }

    context 'PATCH' do
      before { patch :update, format: :json, params: request_params }

      it { should render_template :update }
    end

    context 'PUT' do
      before { put :update, format: :json, params: request_params }

      it { should render_template :update }
    end
  end

  describe '#destroy.json' do
    before { topic_builder }

    before { delete :destroy, params: request_params, format: :destroy }

    it { should render_template :destroy }
  end

  describe 'route test' do
    it do
      should route(:post, '/api/forums/1/topics').to(action: :create, forum_id: 1, format: :json)
    end

    it do
      should route(:get, '/api/forums/1/topics/1').to(action: :show, forum_id: 1, format: :json, id: 1)
    end

    it do
      should route(:patch, '/api/forums/1/topics/1').to(action: :update, forum_id: 1, format: :json, id: 1)
    end

    it do
      should route(:put, '/api/forums/1/topics/1').to(action: :update, forum_id: 1, format: :json, id: 1)
    end

    it do
      should route(:delete, '/api/forums/1/topics/1').to(action: :destroy, forum_id: 1, format: :json, id: 1)
    end
  end

  def topic_builder
    expect(user).to receive_message_chain(:topics, :new)
      .with(no_args).with(params)
      .and_return(topic)
  end
end
