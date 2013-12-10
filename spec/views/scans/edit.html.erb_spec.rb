require 'spec_helper'

describe "scans/edit" do
  before(:each) do
    @scan = assign(:scan, stub_model(Scan,
      :user => stub_model(User),
      :med => stub_model(Med)
    ))
  end

  it "renders the edit scan form" do
    render
    assert_select "form[action=?][method=?]", scan_path(@scan), "post" do
      assert_select "select#scan_med_id[name=?]", "scan[med_id]"
    end
  end
end
