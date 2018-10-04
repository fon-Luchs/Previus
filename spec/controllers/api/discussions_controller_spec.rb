require 'rails_helper'

RSpec.describe Api::DiscussionsController, type: :controller do
  it { should be_a ApplicationController }

  let(:user) { create(:user, :with_auth_token) }

  let(:discussion) { stub_model Discussion }

  let(:topic)      { stub_model Topic }

  let(:params) do
    { discussion: { comment: 'test', topic_id: topic.id } }
  end

  let(:permitted_params) { permit_params! params, :discussion }

  let(:request_params) do
    { comment: 'test', topic_id: topic.id.to_s, forum_id: '4', id: discussion.id.to_s }
  end

  describe '#create.json' do
    let(:request_params) do
      { comment: 'test', topic_id: topic.id.to_s, forum_id: '4' }
    end

    before { resource_builder }

    context 'success' do
      before { expect(discussion).to receive(:save).and_return(true) }

      before { post :create, params: request_params, format: :json }

      it { should render_template :create }
    end

    context 'false' do
      before { expect(discussion).to receive(:save).and_return(true) }

      before { post :create, params: request_params, format: :json }

      it { should render_template :errors }
    end
  end

  describe '#update.json' do
    before { resource_builder }

    before { expect(discussion).to receive(:update).and_return(true) }

    context 'PATCH' do
      before { patch :update, format: :json, params: request_params }

      it { should render_template :update }
    end

    context 'PUT' do
      before { put :update, format: :json, params: request_params }

      it { should render_template :update }
    end
  end

  describe '@destroy.json' do
    before { resource_builder }

    before { delete :destroy, params: request_params, format: :json }

    it { should render_template :destroy }
  end

  describe 'discussion routes' do
    it do
      should route(:post, '/api/forums/1/topics/1/discussions')
        .to(action: :create, format: :json, forum_id: 1, topic_id: 1)
    end

    it do
      should route(:patch, '/api/forums/1/topics/1/discussions/1')
        .to(action: :update, format: :json, forum_id: 1, topic_id: 1, id: 1)
    end

    it do
      should route(:put, '/api/forums/1/topics/1/discussions/1')
        .to(action: :update, format: :json, forum_id: 1, topic_id: 1, id: 1)
    end

    it do
      should route(:delete, '/api/forums/1/topics/1/discussions/1')
        .to(action: :destroy, format: :json, forum_id: 1, topic_id: 1, id: 1)
    end
  end

  def resource_builder
    expect(topic).to receive_message_chain(:user, :discussions, :new)
      .with(no_args).with(no_args).with(permitted_params)
      .and_return(discussion)
  end
end
