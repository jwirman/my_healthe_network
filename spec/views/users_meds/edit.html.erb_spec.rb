require 'spec_helper'

describe "users_meds/edit" do
  before(:each) do
    @users_med = assign(:users_med, stub_model(UsersMed,
      :med_id => "1",
      :freq => "MyString",
      :freq_unit => "MyString"
    ))
  end

  it "renders the edit users_med form" do
    render
    assert_select "form[action=?][method=?]", users_med_path(@users_med), "post" do
      assert_select "select#users_med_med_id[name=?]", "users_med[med_id]"
      assert_select "select#users_med_freq[name=?]", "users_med[freq]"
      assert_select "select#users_med_freq_unit[name=?]", "users_med[freq_unit]"
    end
  end
end
