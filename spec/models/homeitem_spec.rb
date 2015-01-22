require 'rails_helper'


RSpec.describe Homeitem do


  context "userid missing" do
    subject { FactoryGirl.create(:homeitem, :userid => "") }

    it "should raise an error" do
      expect{ subject }.to raise_error
      # expect(FactoryGirl.build(:homeitem, :userid => nil)).not_to be
    end

    it "should raise an error with can't be blank" do
      expect{ subject }.to raise_error(/can't be blank/)
    end
  end

  context "desc missing" do
    subject { FactoryGirl.create(:homeitem, desc: nil) }

    it "should raise an error with can't be blank" do
      expect { subject }.to raise_error(/can't be blank/)
    end
  end

  context "too short of a desc" do
    subject { FactoryGirl.create(:homeitem, desc: "a" * 3) }

    it "should raise an error stating desc 'is too short'" do
      expect { subject }.to raise_error(/must have at least/)
    end
  end

  context "too long of a desc" do
    subject { FactoryGirl.create(:homeitem, desc: "a" * 501) }

    it "should raise an error stating desc 'is too long'" do
      expect { subject }.to raise_error(/is too long/)
    end
  end

end
