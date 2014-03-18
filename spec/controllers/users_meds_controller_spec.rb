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
      it 'assigns all the current_users meds as @users_meds' do
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
      it 'assigns the requested users_med as @user_med' do
        sign_in
        users_med = stub_model(UsersMed)
        UsersMed.should_receive(:find).with('1').and_return users_med
        get :show, id: 1
        expect(response).to be_success
        expect(assigns(:users_med)).to eq users_med
      end
    end
  end # show

  describe "GET new" do
    context 'when logged out' do
      it "should redirect to the sign in page" do
        sign_in nil
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when logged in' do
      it 'assigns a new users_med as @users_med' do
        sign_in
        UsersMed.should_receive(:new).and_return(mock_model(UsersMed).as_new_record)
        get :new
        expect(response).to be_success
        expect(assigns(:users_med)).to be_a_new(UsersMed)
      end
    end
  end # new

  describe "GET edit" do
    context 'when logged out' do
      it "should redirect to the sign in page" do
        sign_in nil
        get :edit, id: 1
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when logged in' do
      it "assigns the requested users_med as @users_med" do
        sign_in
        users_med = stub_model(UsersMed)
        UsersMed.should_receive(:find).with('1').and_return users_med
        get :edit, id: 1
        expect(assigns(:users_med)).to eq(users_med)
      end
    end
  end # edit

  describe "POST create" do
    context 'when logged out' do
      it "should redirect to the sign in page" do
        sign_in nil
        post :create, {users_med: attributes_for(:users_med)}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when logged in' do
      before :each do
        @user = sign_in
        @user.should_receive(:id).once.and_return 1
      end

      describe "with valid params" do
        it "creates a new UsersMed" do
          @user.should_receive(:first_name).once.and_return 'John'
          expect {
            post :create, {users_med: attributes_for(:users_med)}
          }.to change(UsersMed, :count).by(1)
        end

        it "assigns a newly created users_med as @users_med" do
          @user.should_receive(:first_name).once.and_return 'John'
          post :create, {users_med: attributes_for(:users_med)}
          expect(assigns(:users_med)).to be_a(UsersMed)
          expect(assigns(:users_med)).to be_persisted
        end

        it "redirects to the created users_med" do
          @user.should_receive(:first_name).once.and_return 'John'
          post :create, {users_med: attributes_for(:users_med)}
          expect(response).to redirect_to(users_meds_path)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved users_med as @users_med" do
          UsersMed.any_instance.stub(:save).and_return(false)
          post :create, {:users_med => { "num_doses" => "invalid value" }}
          expect(assigns(:users_med)).to be_a_new(UsersMed)
        end

        it "re-renders the 'new' template" do
          UsersMed.any_instance.stub(:save).and_return(false)
          post :create, {:users_med => { "num_doses" => "invalid value" }}
          expect(response).to render_template("new")
        end
      end
    end # logged in
  end # create

  describe "PUT update" do
    context 'when logged out' do
      it "should redirect to the sign in page" do
        sign_in nil
        put :update, {id: 1, users_med: attributes_for(:users_med)}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when logged in' do
      before :each do
        sign_in
        @users_med = stub_model(UsersMed)
        @users_med.user_id = 1
        UsersMed.should_receive(:find).with('1').and_return @users_med
      end

      describe "with valid params" do
        it "updates the requested users_med" do
          @users_med.should_receive(:update).with({ "freq" => "Daily" })
          put :update, {id: 1, :users_med => { "freq" => "Daily" }}
        end

        it "assigns the requested users_med as @users_med" do
          put :update, {id: 1, users_med: attributes_for(:users_med)}
          expect(assigns(:users_med)).to eq(@users_med)
        end

        it "redirects to the users_med" do
          put :update, {id: 1, users_med: attributes_for(:users_med)}
          expect(response).to redirect_to(users_meds_path)
        end
      end

      describe "with invalid params" do
        it "assigns the users_med as @users_med" do
          @users_med.stub(:save).and_return(false)
          put :update, {id: 1, :users_med => { "freq" => "invalid value" }}
          expect(assigns(:users_med)).to eq(@users_med)
        end

        it "re-renders the 'edit' template" do
          @users_med.stub(:save).and_return(false)
          put :update, {id: 1, :users_med => { "freq" => "invalid value" }}
          expect(response).to render_template("edit")
        end
      end
    end # logged in
  end # update

  describe "DELETE destroy" do
    context 'when logged out' do
      it "should redirect to the sign in page" do
        sign_in nil
        delete :destroy, {id: 1}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when logged in' do
      before :each do
        sign_in
      end

      it "destroys the requested users_med" do
        users_med = create(:users_med)
        expect {
          delete :destroy, {:id => users_med.to_param}
        }.to change(UsersMed, :count).by(-1)
      end

      it "redirects to the users_meds list" do
        users_med = create(:users_med)
        delete :destroy, {:id => users_med.to_param}
        expect(response).to redirect_to(users_meds_url)
      end
    end # logged in
  end # destroy

end
