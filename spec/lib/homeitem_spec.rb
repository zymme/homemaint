require "spec_helper"
require "homeitem"

  
  #examples go here (tests)
  
  RSpec.describe "home item name is Girls_with_us" do
    homeitem = Homeitem.new
    # homeitem.name.should == 'Girls_with_us'
    
    specify { expect(homeitem.name).to eq("Girls_with_us") }    
  end
  
  RSpec.describe "homeitem name is myworkouts" do
    homeitem = Homeitem.new
    specify { expect(homeitem.name).to eq("myworkouts") }
  end
  
