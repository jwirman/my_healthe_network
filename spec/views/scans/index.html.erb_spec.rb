require 'spec_helper'

describe "scans/index" do
  before(:each) do
    assign(:scans, [
      stub_model(Scan,
        :user => create(:user),
        :med => create(:med),
        :created_at => DateTime.now
      ),
      stub_model(Scan,
        :user => create(:user),
        :med => create(:med),
        :created_at => DateTime.now
      )
    ])
  end

  it "renders a list of scans" do
    render
    assert_select "tr>td", :text => "Generic 10mg (Brand)", count: 2
    assert_select "tr>td", :text => /EST/, :count => 2
  end
end
