require 'rails_helper'


RSpec.describe Homeitem do


  context "userid missing" do
    subject { FactoryGirl.create(:homeitem, :userid => "") }

    it "should require a userid" do
      expect{ subject }.to raise_error
      # expect(FactoryGirl.build(:homeitem, :userid => nil)).not_to be
    end

    it "should require a userid and generate error with can't be blank" do
      expect{ subject }.to raise_error(/can't be blank/)
    end
  end

  

end



# describe "validations" do
#
#   before { subject.valid? }
#
#   [ :userid ].each do |user|
#     # binding.pry
#     context "when #{user} is nil" do
#       subject { Homeitem.new(user => nil) }
#
#       it "shouldn't allow blank #{user}" do
#         binding.pry
#         expect { subject }.to raise_error
#       end
#
#     end
#
#   end
# end
