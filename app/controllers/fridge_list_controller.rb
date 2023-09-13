class FridgeListController < ApplicationController
  before_action :set_fridge_list, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @fridge_list = FridgeList.new
  end

  def create
    @fridge_list = FridgeList.new(fridge_list_params)

    if @fridge_list.save
      redirect_to @fridge_list
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @fridge_list.update(fridge_list_params)
      redirect_to @fridge_list
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @fridge_list.destroy

    redirect_to fridge_lists_url
  end

  private

  def set_fridge_list
    @fridge_list = FridgeList.find(params[:id])
  end

end
