require 'rails_helper'

RSpec.describe Api::ProfilesController, type: :controller do
  it { should be_a ApplicationController }

  it { should be_a ApplicationController }

  let(:user) { stub_model User }

  let(:password) { FFaker::Internet.password }

  let(:email) { FFaker::Internet.email }

  let(:name)  { FFaker::Internet.user_name }

  let(:params) do
    { user:
      {
        email: email,
        username: name,
        password: password,
        password_confirmation: password
      } }
  end

  let(:permitted_params) { permit_params! params, :user }

  describe '#create.json' do
    before do
      expect(User).to receive(:new).with(permitted_params).and_return(user)
    end

    context do
      before { expect(user).to receive(:save).and_return(true) }

      before { post :create, params: params, format: :json }

      it { should render_template :create }
    end

    context do
      before { expect(user).to receive(:save).and_return(false) }

      before { post :create, params: params, format: :json }

      it { should render_template :errors }
    end
  end

  describe '#show.json' do
    it { expect(User).to receive(:fins).with(user.id).and_return(user) }

    before { get :create, params: params, format: :json }

    it { should render_template :show }
  end

  describe 'routes test' do
    it { should route(:post, '/api/profile').to(action: :create, format: :json) }
    it { should route(:get,  '/api/profile').to(action: :show, format: :json) }
  end
end
