class Shop::SettingsController < ApplicationController
before_filter :authenticate_user!
	def index
		@products = Shop::Product.all
	end
	def save
		ShopSettings.main_product1=params[:product1]
		ShopSettings.main_product2=params[:product2]		
		ShopSettings.main_product3=params[:product3]		
		redirect_to :action=>:index
	end
end
