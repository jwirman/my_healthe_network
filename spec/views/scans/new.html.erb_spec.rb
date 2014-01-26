require 'spec_helper'

describe "scans/new" do
  before(:each) do
    assign(:scan, stub_model(Scan,
      :user => stub_model(User),
      :med => stub_model(Med)
    ).as_new_record)
  end

  it "renders new scan form" do
    user = double(:user)
    user.stub_chain(:meds, :uniq).and_return [:one, :two]
    view.stub(:current_user).and_return user
    render
    assert_select "form[action=?][method=?]", scans_path, "post" do
      assert_select "select#scan_med_id[name=?]", "scan[med_id]"
    end
  end
end
