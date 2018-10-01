require 'rails_helper'

RSpec.describe Api::ProfilesController, type: :controller do
  it { should be_a ApplicationController }

  describe '#create.json' do
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

    before do
      expect(User).to receive(:new).with(permitted_params).and_return(user)
    end

    context do
      before { expect(user).to receive(:save).and_return(true) }

      before { post :create, params: params, format: :json }

      it { expect(response.body).to eq('lol') }

      it { should render_template :create }
    end

    context do
      before { expect(user).to receive(:save).and_return(false) }

      before { post :create, params: params, format: :json }

      it { should render_template :errors }
    end
  end
end
