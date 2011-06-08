class ShopsController < ApplicationController
  respond_to :html
  # GET /shops
  def index
    @shops = Shop.all
    respond_with @shops
  end

  # GET /shops/1
  def show
    @shop = Shop.find(params[:id])
    respond_with @shop
  end

  # GET /shops/new
  def new
    @shop = Shop.new
    respond_with @shop
  end

  # GET /shops/1/edit
  def edit
    @shop = Shop.find(params[:id])
    respond_with @shop
  end

  # POST /shops
  def create
    @shop = Shop.new(params[:shop])
    if @shop.save
      flash[:notice] = 'Shop was successfully created.'
    end
    respond_with @shop
  end

  # PUT /shops/1
  def update
    @shop = Shop.find(params[:id])
    if @shop.update_attributes(params[:shop])
      flash[:notice] = 'Shop was successfully updated.'
    end
    respond_with @shop
  end

  # DELETE /shops/1
  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    respond_with @shop
  end
end
