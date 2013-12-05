require 'spec_helper'

describe UsersMedsController do

  describe "GET index" do
    context 'when logged out' do
      it "should redirect to the sign in page" do
        sign_in nil
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when logged in' do
      it 'should get the current_users meds' do
        user = sign_in
        user.should_receive(:users_meds).once.and_return [:med_one, :med_two]
        get :index
        expect(response).to be_success
        expect(assigns(:users_meds)).to eq [:med_one, :med_two]
      end
    end
  end # index

  describe "GET show" do
    context 'when logged out' do
      it "should redirect to the sign in page" do
        sign_in nil
        get :show, id: 1
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when logged in' do
      it 'should show the users_med by id' do
        sign_in
        users_med = stub_model(UsersMed)
        UsersMed.should_receive(:find).with('1').and_return users_med
        get :show, id: 1
        expect(response).to be_success
        expect(assigns(:users_med)).to eq users_med
      end
    end
  end # show

end
