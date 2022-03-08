class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  # def index
  #   @furimas = Furima.all
  # end
  
  def new
    @furima = Furima.new
  end

  def create
    
    @furima = Furima.new(furima_params)
    if @furima.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def furima_params
    params.require(:furima).permit(:image, :name, :introduction, :category_id, :condition_id, :postage_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end


end
