class CatalogController < ApplicationController
  def index
  	@product1 = Shop::Product.find_by_id(ShopSettings.main_product1)
  	@product2 = Shop::Product.find_by_id(ShopSettings.main_product2)  	
  	@product3 = Shop::Product.find_by_id(ShopSettings.main_product3)  	  	
  end
end
