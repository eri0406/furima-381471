class ItemsController < ApplicationController
	def index
		@items = Item.order("created_at DESC")
	end

	def new
		@items = Item.new
	end

	def create
	end

end
