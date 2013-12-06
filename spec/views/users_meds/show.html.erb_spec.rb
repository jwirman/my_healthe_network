require 'spec_helper'

describe "users_meds/show" do
  before(:each) do
    @users_med = assign(:users_med, stub_model(UsersMed,
      :med => stub_model(Med),
      :freq => "Frequency",
      :freq_unit => "Unit"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/()/)
    expect(rendered).to match(/Frequency/)
    expect(rendered).to match(/Unit/)
  end
end
