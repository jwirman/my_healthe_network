require 'spec_helper'

describe "scans/show" do
  before(:each) do
    @scan = assign(:scan, stub_model(Scan,
      :user => create(:user),
      :med => create(:med),
      :created_at => DateTime.now
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/@example.com/)
    expect(rendered).to match(/Generic 10mg \(Brand\)/)
    expect(rendered).to match(/#{@scan.created_at.strftime(Date::DATE_FORMATS[:date_time])}/)
  end
end
