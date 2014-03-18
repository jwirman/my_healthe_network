require 'spec_helper'

describe "scans/index" do
  before(:each) do
    @now = DateTime.now.in_time_zone
    @user = create(:user)
    @med = create(:med)
    assign(:scans, [
      stub_model(Scan,
        :user => @user,
        :med => @med,
        :created_at => @now
      ),
      stub_model(Scan,
        :user => @user,
        :med => @med,
        :created_at => @now
      )
    ])
  end

  it "renders a list of scans" do
    render
    assert_select "tr>td", text: @med
    assert_select "tr>td", text: /#{@now.strftime(Date::DATE_FORMATS[:date_time])}/
  end
end
