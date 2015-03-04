class HomeitemsController < ApplicationController

  skip_before_action :compare_runs


  before_action :set_homeitem, only: [:show, :edit, :update, :destroy, :merge_test]

  # GET /homeitems
  # GET /homeitems.json
  def index
    @homeitems = Homeitem.all
  end

  # GET /homeitems/1/mergetest
  def merge_test
    #map attributes over to the mongo representation
    hitem = Hitem.new
    hitem.hitem_id = @homeitem.id
    hitem.name = @homeitem.name
    hitem.status = @homeitem.status
    hitem.stagetime = @homeitem.stagetime
    hitem.userid = @homeitem.userid
    hitem.desc = @homeitem.desc
    hitem.guid = UUIDTools::UUID.random_create
    hitem.created_at = @homeitem.created_at
    hitem.updated_at = @homeitem.updated_at

    hitem.save!

    render json: hitem, status: :ok
  end

  # GET /homeitems/compare
  def compare_runs

    #pretend that current run guid has been retreived and previous run guid has been retrieved.

    currentRunGuid = "504e3a52-0552-4dd5-96da-3152cd282457"
    previousRunGuid = "c5e412b9-f79d-43c9-94ba-d92a07db31ef"

    currentRun = Hitem.find_by_guid(currentRunGuid)
    previousRun = Hitem.find_by_guid(previousRunGuid)

    if currentRun == previousRun
      puts "equal run data"
    else
      puts "Not equal run data"
    end

    binding.pry

    currentRunHash = currentRun.attributes
    previousRunHash = previousRun.attributes

    hashme = Hash[ (previousRunHash.to_a | currentRunHash.to_a) - (previousRunHash.to_a & currentRunHash.to_a) ]


    builder = Nokogiri::XML::Builder.new { |xml|

      xml.rct_def {
        xml.rct_details {
          hashme.each { |node|
            xml.diff node.to_s
          }

        }
      }
    }

    puts builder.to_xml

    render json: { status: 'success' }, status: :ok


  end

  # GET /homeitems/1
  # GET /homeitems/1.json
  def show
  end

  # GET /homeitems/new
  def new
    @homeitem = Homeitem.new
  end

  # GET /homeitems/1/edit
  def edit
  end

  # POST /homeitems
  # POST /homeitems.json
  def create
    # binding.pry
    @homeitem = Homeitem.new(homeitem_params)
    @homeitem.stagetime = DateTime.now

    respond_to do |format|
      if @homeitem.save
        # binding.pry
        format.html { redirect_to @homeitem, notice: 'Homeitem was successfully created.' }
        format.json { render :show, status: :created, location: @homeitem }
      else
        format.html { render :new }
        format.json { render json: @homeitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homeitems/1
  # PATCH/PUT /homeitems/1.json
  def update
    respond_to do |format|
      if @homeitem.update(homeitem_params)
        format.html { redirect_to @homeitem, notice: 'Homeitem was successfully updated.' }
        format.json { render :show, status: :ok, location: @homeitem }
      else
        format.html { render :edit }
        format.json { render json: @homeitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homeitems/1
  # DELETE /homeitems/1.json
  def destroy
    @homeitem.destroy
    respond_to do |format|
      format.html { redirect_to homeitems_url, notice: 'Homeitem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homeitem
      begin
        @homeitem = Homeitem.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        #render status: :not_found
        redirect_to "/not_found.html"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homeitem_params
      params.require(:homeitem).permit(:name, :status, :userid, :desc)
    end

    def update_run_info

    end
end
