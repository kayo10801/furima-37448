class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :moov, only: [:index, :create]
  def index
    @furima = Furima.find(params[:furima_id])
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new
   
  end

  def create
   
    @furima = Furima.find(params[:furima_id])
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new(purchase_record_params)
 
    if @purchase_record_shipping_address.valid?
       pay_item
       @purchase_record_shipping_address.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_shipping_address).permit(:post_cord, :prefecture_id, :city, :address, :phone_number, :building_name).merge(token: params[:token], furima_id: params[:furima_id], user_id: current_user.id)

  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
   
    Payjp::Charge.create(
      amount: Furima.find(params[:furima_id]).price, 
      card: purchase_record_params[:token],    
      currency: 'jpy'                
    )
  end
 

  def moov
      @furima = Furima.find(params[:furima_id])
    if @furima.user_id != current_user.id || @furima.purchase_record != nil
      redirect_to root_path
    end
  end

end
