class HomeitemsController < ApplicationController
  before_action :set_homeitem, only: [:show, :edit, :update, :destroy]

  # GET /homeitems
  # GET /homeitems.json
  def index
    @homeitems = Homeitem.all
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
        render status: :not_found
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homeitem_params
      params.require(:homeitem).permit(:name, :status, :userid, :desc)
    end
end
