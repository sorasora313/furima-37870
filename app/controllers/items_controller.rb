class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :sign_in, only: [:new]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :order_url, only: [:edit, :update, :destroy]
  def index
    @items = Item.all.order("created_at DESC")
 end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
     render :new
    end
  end

  def show
    
  end

  def edit
    
    if user_signed_in? && current_user.id == @item.user_id  
    else
      redirect_to root_path
    end

  end

  

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end
def destroy
  if @item.user_id  ==  current_user.id
      @item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :condition_id, :charge_id, :prefecture_id,:schedule_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sign_in
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  end
  
  def order_url
    if @item.user_id != current_user.id || @item.order != nil
      redirect_to root_path
    end
  end

end