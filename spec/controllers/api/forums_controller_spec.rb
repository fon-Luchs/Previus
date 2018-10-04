require 'rails_helper'

RSpec.describe Api::ForumsController, type: :controller do
  it { should be_a ApplicationController }

  let(:forum) { stub_model Forum }

  let(:params) { { forum: { title: 'test' } } }

  let(:request_params) { { title: 'test', id: forum.id.to_s } }

  let(:permitted_params) { permit_params! params, :forum }

  describe '#index.json' do
    before { expect(Forum).to receive(:all).and_return(forum) }

    before { get :index, format: :json }

    it { should render_template :index }
  end

  describe '#show.json' do
    before { expect(Forum).to receive(:find).with(forum.id).and_return(forum) }

    it { should render_template :show }
  end

  describe '#update.json' do
    before { resource_builder }

    before { expect(forum).to receive(:update).and_return(true) }

    context 'PATCH' do
      before { patch :update, format: :json, params: request_params }

      it { should render_template :update }
    end

    context 'PUT' do
      before { put :update, format: :json, params: request_params }

      it { should render_template :update }
    end
  end

  describe '#create.json' do
    before { resource_builder }

    context 'success' do
      before { expect(forum).to receive(:save).and_return(true) }

      before { post :create, params: request_params, format: :json }

      it { should render_template :create }
    end

    context 'fail' do
      before { expect(forum).to receive(:save).and_return(false) }

      before { post :create, params: request_params, format: :json }

      it { should render_template :errors }
    end
  end

  describe '#destroy.json' do
    before { resource_builder }

    before { delete :destroy, params: request_params, format: :json }

    it { should render_template :destroy }
  end

  describe 'routes test' do
    it { should route(:get, '/api/forums').to(action: :index, format: :json) }

    it { should route(:post, '/api/forums').to(action: :create, format: :json) }

    it { should route(:get, '/api/forums/1').to(action: :show, format: :json, id: 1) }

    it { should route(:post, '/api/forums').to(action: :create, format: :json) }

    it { should route(:patch, '/api/forums/1').to(action: :update, format: :json, id: 1) }

    it { should route(:put, '/api/forums/1').to(action: :update, format: :json, id: 1) }

    it { should route(:delete, '/api/forums/1').to(action: :destroy, format: :json, id: 1) }
  end

  def resource_builder
    expect(Forum).to receive(:new).with(permitted_params).and_return(forum)
  end
end
