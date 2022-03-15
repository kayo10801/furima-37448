class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_furima, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :moov, only:[:edit, :update, :destroy]


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
    @furima.destroy
    redirect_to root_path
    
  end

  def edit
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

  def contributor_confirmation
    redirect_to root_path unless current_user == @furima.user
  end

  def moov
     @furima = Furima.find(params[:furima_id])
    if @furima.user_id != current_user.id || @furima.purchase_record != nil
      redirect_to root_path
    end
  end
end
