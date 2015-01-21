require 'rails_helper'

describe "Routes" do
  describe "HomeitemsController" do
    
    it "routes to get new" do
      expect({ get: '/homeitems/new' }).to route_to(controller: 'homeitems', action: 'new')
    end
    
    it "routes to post create" do
      expect({ post: '/homeitems' }).to route_to(controller: 'homeitems', action: 'create')
    end
    
    it "does not route get Edit" do
      expect({ get: 'homeitems/42/edit'}).not_to be_routable
    end
    
    it "routes to get homeitems/43" do
      expect({ get: '/homeitems/43'}).to route_to(controller: 'homeitems', action: 'show', id: '43')
    end
  end  #describe HomeitemsController
  
end #describe Routes