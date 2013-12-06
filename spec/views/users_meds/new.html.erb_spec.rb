require 'spec_helper'

describe "users_meds/new" do
  before(:each) do
    assign(:users_med, stub_model(UsersMed,
      :med_id => "1",
      :freq => "MyString",
      :freq_unit => "MyString"
    ).as_new_record)
  end

  it "renders new users_med form" do
    render
    assert_select "form[action=?][method=?]", users_meds_path, "post" do
      assert_select "select#users_med_med_id[name=?]", "users_med[med_id]"
      assert_select "select#users_med_freq[name=?]", "users_med[freq]"
      assert_select "select#users_med_freq_unit[name=?]", "users_med[freq_unit]"
    end
  end
end
