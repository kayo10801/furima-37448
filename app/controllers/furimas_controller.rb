class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_furima, except: [:index, :new, :create]

  def index
    @furimas = Furima.includes(:user).order("created_at DESC")
    
  end

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

  def destroy
  end
  


  def edit
    unless @furima.user_id == current_user.id
    redirect_to root_path
    end
  end
  
  def update
    if @furima.update(furima_params)
       redirect_to furima_path(@furima)
    else
       render  :edit
    end
  end

    
  def show
  end

  private

  def furima_params
    params.require(:furima).permit(:image, :name, :introduction, :category_id, :condition_id, :postage_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_furima
    @furima = Furima.find(params[:id])
  end 

end
