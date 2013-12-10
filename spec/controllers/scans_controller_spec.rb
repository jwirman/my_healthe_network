require 'spec_helper'

describe ScansController do

  before :each do
    @user = sign_in
  end

  describe "GET index" do
    it "assigns all scans as @scans" do
      scan = stub_model(Scan)
      @user.should_receive(:scans).and_return scan
      get :index
      expect(assigns(:scans)).to eq(scan)
    end
  end

  describe "GET show" do
    it "assigns the requested scan as @scan" do
      scan = stub_model(Scan)
      Scan.should_receive(:find).with('1').and_return scan
      get :show, {id: 1}
      expect(assigns(:scan)).to eq(scan)
    end
  end

  describe "GET new" do
    it "assigns a new scan as @scan" do
      Scan.should_receive(:new).and_return(mock_model(Scan).as_new_record)
      get :new
      expect(assigns(:scan)).to be_a_new(Scan)
    end
  end

  describe "GET edit" do
    it "assigns the requested scan as @scan" do
      scan = stub_model(Scan)
      Scan.should_receive(:find).with('1').and_return scan
      get :edit, {id: 1}
      expect(assigns(:scan)).to eq(scan)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Scan" do
        @user.should_receive(:id).once.and_return 1
        expect {
          post :create, {scan: {med_id: 1}}
        }.to change(Scan, :count).by(1)
      end

      it "assigns a newly created scan as @scan" do
        @user.should_receive(:id).once.and_return 1
        post :create, {:scan => {med_id: 1}}
        expect(assigns(:scan)).to be_a(Scan)
        expect(assigns(:scan)).to be_persisted
      end

      it "redirects to the created scan" do
        @user.should_receive(:id).once.and_return 1
        post :create, {:scan => {med_id: 1}}
        expect(response).to redirect_to(Scan.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved scan as @scan" do
        @user.should_receive(:id).once.and_return 1
        Scan.any_instance.stub(:save).and_return(false)
        post :create, {:scan => { "user" => "invalid value" }}
        expect(assigns(:scan)).to be_a_new(Scan)
      end

      it "re-renders the 'new' template" do
        @user.should_receive(:id).once.and_return 1
        Scan.any_instance.stub(:save).and_return(false)
        post :create, {:scan => { "user" => "invalid value" }}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    before :each do
      @scan = stub_model(Scan)
      Scan.should_receive(:find).with('1').and_return @scan
    end

    describe "with valid params" do
      it "updates the requested scan" do
        @scan.should_receive(:update).with({ "med_id" => "2" })
        put :update, {id: 1, :scan => { "med_id" => "2" }}
      end

      it "assigns the requested scan as @scan" do
        put :update, {id: 1, scan: {"med_id" => "1"}}
        expect(assigns(:scan)).to eq(@scan)
      end

      it "redirects to the scan" do
        put :update, {id: 1, scan: {"med_id" => "1"}}
        expect(response).to redirect_to(@scan)
      end
    end

    describe "with invalid params" do
      it "assigns the scan as @scan" do
        @scan.stub(:save).and_return(false)
        put :update, {id: 1, scan: { "med_id" => "invalid value" }}
        expect(assigns(:scan)).to eq(@scan)
      end

      it "re-renders the 'edit' template" do
        @scan.stub(:save).and_return(false)
        put :update, {id: 1, scan: { "med_id" => "invalid value" }}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested scan" do
      scan = create(:scan)
      expect {
        delete :destroy, {id: scan.to_param}
      }.to change(Scan, :count).by(-1)
    end

    it "redirects to the scans list" do
      scan = create(:scan)
      delete :destroy, {:id => scan.to_param}
      expect(response).to redirect_to(scans_url)
    end
  end

end
