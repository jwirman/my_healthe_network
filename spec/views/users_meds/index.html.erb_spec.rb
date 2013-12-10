require 'spec_helper'

describe "users_meds/index" do
  before(:each) do
    assign(:users_meds, [
      stub_model(UsersMed,
        :med => stub_model(Med),
        :freq => "One time",
        :freq_unit => "Daily"
      ),
      stub_model(UsersMed,
        :med => stub_model(Med),
        :freq => "One time",
        :freq_unit => "Daily"
      )
    ])
  end

  it "renders a list of users_meds" do
    render
    assert_select "tr>td", :text => "()", :count => 2
    assert_select "tr>td", :text => "One time", :count => 2
    assert_select "tr>td", :text => "Daily", :count => 2
  end
end
