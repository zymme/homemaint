require "spec_helper"
require "rails_helper"

RSpec.describe HomeitemsController, :type => :controller do
  
  describe "#index" do
    context "GET index" do
      subject { get :index }
      
      it "gets response status 200" do
        subject
        expect(response.status).to eq(200)
      end
    
      it "assigns @homeitems" do
        homeitem = Homeitem.create
        subject
        expect(assigns(:homeitems)).to eq([homeitem])
      end
    end
    
    context "when there are no homeitems" do
      subject { get :index }
      
      it "assigns @homeitems" do
        subject
        expect(assigns(:homeitems)).to eq([])
      end  
    end  #context
    
    context "when there are some homeitems" do
      let(:homeitems) do
        [
          Homeitem.create(name: 'Fix step in garage', userid: 'zimmerd', status: 'PENDING', desc: 'Fix cement step in garage.'),
          Homeitem.create(name: 'Fix back patio landing', userid: 'zimmerd', status: 'PENDING', desc: 'Fix back patio cement that has broken away')
        ]
        end  #let
        before { homeitems }
        subject { get :index }
        
        it "assigns @homeitems" do
          subject # let!
          expect(assigns(:homeitems)).to eq(homeitems)
        end      
    end  #context
    
  end
   
  
  
 
  
  describe "#create" do
    context "when saving the homeitem" do
      subject { post :create, homeitem: { 
        name: 'Fix Master Bath', status: 'Pending', userid: 'zimmerd', desc: 'Fix drywall by shower door.' }
      }    
      
      it "saves the homeitem" do
        subject
        expect(Homeitem.all.count).to eq(1)
      end
      
      it "responds with a 302 http status" do
        subject
        expect(response.status).to eq(302)
      end
      
      it "redirects to the homeitem created" do
        expect(subject).to redirect_to(homeitem_path(Homeitem.first.id))
      end
    end  #context   
  end  #describe #create
  
  describe "#show" do
    context "when the homeitem exists" do
      let(:homeitem) { Homeitem.create( name: 'Fix Drywall', status: 'PENDING', userid: 'zimmerd', desc: 'Fix drywall by shower door.') }
      subject { get :show, id: homeitem.id }
      
      it "assigns @homeitem" do
        subject
        expect(assigns(:homeitem)).to eq(homeitem)
      end
      
      it "renders the show template" do
        subject
        expect(response).to render_template("show")
      end
    end
    
    context "when homeitem does not exist" do
      subject { get :show, id: 404 }
      
      it "is redirected to not_found.html page" do
        # subject
        #expect(response.status).to eq(404)
        expect(subject).to redirect_to("/not_found.html")
      end 
      
    end #context
    
  end
  
  describe "#destroy" do
    context "when homeitem exists" do
      let(:homeitem) { Homeitem.create( name: 'Fix Drywall', status: 'PENDING', userid: 'zimmerd', desc: 'Fix drywall by shower door.') }
      subject { post :destroy, id: homeitem.id }
      
      it "deletes the homeitem" do
        subject
        expect(Homeitem.all.count).to eq(0)
      end
    end  #context
    
    context "when homeitem does not exist" do
      subject { post :destroy, id: 404 }
      
      it "is redirected to not_found.html page" do
        subject
        # expect(response.status).to be 404
        expect(subject).to redirect_to("/not_found.html")
      end
    end  #context
    
    
    
    
    
    
    
    
  end
  
  
end