require 'spec_helper'

describe "users_meds/index" do
  before(:each) do
    assign(:users_meds, [
      stub_model(UsersMed,
        :med => stub_model(Med),
        :freq => "Frequency",
        :freq_unit => "Unit"
      ),
      stub_model(UsersMed,
        :med => stub_model(Med),
        :freq => "Frequency",
        :freq_unit => "Unit"
      )
    ])
  end

  it "renders a list of users_meds" do
    render
    assert_select "tr>td", :text => "()".to_s, :count => 2
    assert_select "tr>td", :text => "Frequency".to_s, :count => 2
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
  end
end
