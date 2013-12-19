require 'spec_helper'

describe ApplicationController do

  controller do
    before_action :authenticate_admin_user!

    def admin_action
    end
  end

  before do
    @routes.draw do
      get '/anonymous/admin_action'
    end
  end

  it 'redirects to root_path if current_user is not an admin' do
    user = sign_in
    user.should_receive(:is_admin?).and_return false
    get :admin_action
    expect(response).to redirect_to(root_path)
  end

end
