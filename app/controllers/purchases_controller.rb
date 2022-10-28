class PurchasesController < ApplicationController
before_action :authenticate_user!, only:[:index]
before_action :set_item, only:[:index, :create]
before_action :correct_current_user, only:[:index, :create]

	def index
		@purchase_address = PurchaseAddress.new
	end

	def create
		@purchase_address = PurchaseAddress.new(purchase_params)
		if @purchase_address.valid?
			@purchase_address.save
			 redirect_to root_path
		 else
			 render :index
		end
	end
	
	private
	
	def set_item
		@item = Item.find(params[:item_id])
	end

	 def correct_current_user
		 if @item.user_id == current_user || @item.purchase != nil
			redirect_to root_path
		 end
	 end

	def purchase_params
		params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :building_name, :house_number, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
	end
end
