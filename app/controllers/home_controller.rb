class HomeController < ApplicationController
  def index
    @item = Item.new
    @items = Item.all
  end
end
