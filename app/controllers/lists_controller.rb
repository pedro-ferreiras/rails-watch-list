class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_list)

    list.save
    redirect_to lists_path(@list.id)
  end





  private


  def params_list
    params.require(:list).permit(:name)
  end



end
