require 'rails_helper'
require 'rspec/active_model/mocks'

describe "homeitems/show" do

  before do
    assign(:homeitem,
    stub_model(Homeitem, name: 'Fix Dry Wall', desc: 'Fix drywall in master bath', status: 'PENDING', userid: 'zimmerd')
    )

  end  #before

  it "displays the desc" do
    render
    expect(rendered).to match("Fix drywall in master bath")
  end

  it "displays the userid" do
    render
    expect(rendered).to match("zimmerd")
  end

end  #describe "homeitems/show"
