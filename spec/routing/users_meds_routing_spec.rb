require "spec_helper"

describe UsersMedsController do
  describe "routing" do

    it "routes to #index" do
      expect(get("/users_meds")).to route_to("users_meds#index")
    end

    it "routes to #new" do
      expect(get("/users_meds/new")).to route_to("users_meds#new")
    end

    it "routes to #show" do
      expect(get("/users_meds/1")).to route_to("users_meds#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get("/users_meds/1/edit")).to route_to("users_meds#edit", :id => "1")
    end

    it "routes to #create" do
      expect(post("/users_meds")).to route_to("users_meds#create")
    end

    it "routes to #update" do
      expect(put("/users_meds/1")).to route_to("users_meds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete("/users_meds/1")).to route_to("users_meds#destroy", :id => "1")
    end

  end
end
