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
  end

#  describe "POST create" do
#    describe "with valid params" do
#      it "creates a new Blah" do
#        expect {
#          post :create, {:blah => valid_attributes}, valid_session
#        }.to change(Blah, :count).by(1)
#      end
#
#      it "assigns a newly created blah as @blah" do
#        post :create, {:blah => valid_attributes}, valid_session
#        assigns(:blah).should be_a(Blah)
#        assigns(:blah).should be_persisted
#      end
#
#      it "redirects to the created blah" do
#        post :create, {:blah => valid_attributes}, valid_session
#        response.should redirect_to(Blah.last)
#      end
#    end
#
#    describe "with invalid params" do
#      it "assigns a newly created but unsaved blah as @blah" do
#        # Trigger the behavior that occurs when invalid params are submitted
#        Blah.any_instance.stub(:save).and_return(false)
#        post :create, {:blah => { "name" => "invalid value" }}, valid_session
#        assigns(:blah).should be_a_new(Blah)
#      end
#
#      it "re-renders the 'new' template" do
#        # Trigger the behavior that occurs when invalid params are submitted
#        Blah.any_instance.stub(:save).and_return(false)
#        post :create, {:blah => { "name" => "invalid value" }}, valid_session
#        response.should render_template("new")
#      end
#    end
#  end
#
#  describe "PUT update" do
#    describe "with valid params" do
#      it "updates the requested blah" do
#        blah = Blah.create! valid_attributes
#        # Assuming there are no other blahs in the database, this
#        # specifies that the Blah created on the previous line
#        # receives the :update_attributes message with whatever params are
#        # submitted in the request.
#        Blah.any_instance.should_receive(:update).with({ "name" => "MyString" })
#        put :update, {:id => blah.to_param, :blah => { "name" => "MyString" }}, valid_session
#      end
#
#      it "assigns the requested blah as @blah" do
#        blah = Blah.create! valid_attributes
#        put :update, {:id => blah.to_param, :blah => valid_attributes}, valid_session
#        assigns(:blah).should eq(blah)
#      end
#
#      it "redirects to the blah" do
#        blah = Blah.create! valid_attributes
#        put :update, {:id => blah.to_param, :blah => valid_attributes}, valid_session
#        response.should redirect_to(blah)
#      end
#    end
#
#    describe "with invalid params" do
#      it "assigns the blah as @blah" do
#        blah = Blah.create! valid_attributes
#        # Trigger the behavior that occurs when invalid params are submitted
#        Blah.any_instance.stub(:save).and_return(false)
#        put :update, {:id => blah.to_param, :blah => { "name" => "invalid value" }}, valid_session
#        assigns(:blah).should eq(blah)
#      end
#
#      it "re-renders the 'edit' template" do
#        blah = Blah.create! valid_attributes
#        # Trigger the behavior that occurs when invalid params are submitted
#        Blah.any_instance.stub(:save).and_return(false)
#        put :update, {:id => blah.to_param, :blah => { "name" => "invalid value" }}, valid_session
#        response.should render_template("edit")
#      end
#    end
#  end
#
#  describe "DELETE destroy" do
#    it "destroys the requested users_med" do
#      blah = Blah.create! valid_attributes
#      expect {
#        delete :destroy, {:id => blah.to_param}, valid_session
#      }.to change(Blah, :count).by(-1)
#    end
#
#    it "redirects to the blahs list" do
#      blah = Blah.create! valid_attributes
#      delete :destroy, {:id => blah.to_param}, valid_session
#      response.should redirect_to(blahs_url)
#    end
#  end


end
