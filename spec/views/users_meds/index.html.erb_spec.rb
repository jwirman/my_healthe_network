require 'spec_helper'

describe "users_meds/index" do
  before(:each) do
    assign(:users_meds, [
      stub_model(UsersMed,
        :med => stub_model(Med),
        :freq => "time_1",
        :freq_unit => "daily"
      ),
      stub_model(UsersMed,
        :med => stub_model(Med),
        :freq => "time_1",
        :freq_unit => "daily"
      )
    ])
  end

  it "renders a list of users_meds" do
    render
    assert_select "tr>td", :text => "()", :count => 2
    assert_select "tr>td", :text => "One time daily", :count => 2
  end
end
