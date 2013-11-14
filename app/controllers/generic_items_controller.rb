class GenericItemsController < ApplicationController
  before_action :set_generic_item, only: [:show, :edit, :update, :destroy]

  # GET /generic_items
  # GET /generic_items.json
  def index
    @generic_items = GenericItem.all
  end

  # GET /generic_items/1
  # GET /generic_items/1.json
  def show
  end

  # GET /generic_items/new
  def new
    @generic_item = GenericItem.new
  end

  # GET /generic_items/1/edit
  def edit
  end

  # POST /generic_items
  # POST /generic_items.json
  def create
    @generic_item = GenericItem.new(generic_item_params)

    respond_to do |format|
      if @generic_item.save
        format.html { redirect_to @generic_item, notice: 'Generic item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @generic_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @generic_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generic_items/1
  # PATCH/PUT /generic_items/1.json
  def update
    respond_to do |format|
      if @generic_item.update(generic_item_params)
        format.html { redirect_to @generic_item, notice: 'Generic item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @generic_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generic_items/1
  # DELETE /generic_items/1.json
  def destroy
    @generic_item.destroy
    respond_to do |format|
      format.html { redirect_to generic_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_generic_item
      @generic_item = GenericItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def generic_item_params
      params.require(:generic_item).permit(:title, :subtitle, :creator)
    end
end
