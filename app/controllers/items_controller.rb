class ItemsController < ApplicationController
  before_action :set_item, only: [:destroy]

  def index
    @item = current_user.items.new
    @items = current_user.items.all
  end

  def create
    @item = current_user.items.new(item_params)    

    respond_to do |format|
      if @item.save
        format.html { redirect_to root_path, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  	@item.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Item was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private  
  def set_item
    @item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:name, :quantity)
  end
end
