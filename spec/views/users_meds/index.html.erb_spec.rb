require 'spec_helper'

describe "users_meds/index" do
  before(:each) do
    med = create(:med)
    assign(:users_meds, [
      create(:users_med, med_id: med.id),
      create(:users_med, med_id: med.id)
    ])
  end

  it "renders a list of users_meds" do
    render
    assert_select "tr>td", :text => "Generic 10mg (Brand)"
  end
end
