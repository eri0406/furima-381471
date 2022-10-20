class ItemsController < ApplicationController
	before_action :authenticate_user!, only:[:new, :edit, :detroy]
	before_action :set_item, only:[:show, :edit, :update, :destroy]
	before_action :correct_current_user, only:[:edit, :update]

	def index
		@items = Item.all.order(created_at: :DESC)
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to root_path
		else
			render :new
		end
	end

		def show
		end

		def edit
		end

		def update
			if @item.update(item_params)
				redirect_to item_path
			else
				render :edit
		end
	end
	
	 def destroy
		if @item.user_id == current_user.id
		 @item.destroy
		 redirect_to root_path
		else
			redirect_to root_path
		end
	 end

	private

	def item_params
		params.require(:item).permit(:name, :description, :category_id, :state_id, :shipping_fee_id, :prefecture_id, :reach_date_id, :price, :image).merge(user_id: current_user.id)
	end

	def correct_current_user
		if @item.user_id != current_user.id
			redirect_to root_path
		end
	end

	def set_item
		@item = Item.find(params[:id])
	end
end
