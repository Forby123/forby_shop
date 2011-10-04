# To change this template, choose Tools | Templates
# and open the template in the editor.

class Shop::ProductsController < ApplicationController
before_filter :authenticate_user!
  def index
  	@categories = Shop::Category.all
  end
  def category_products
    @category = Shop::Category.find(params[:category_id])
    @products = @category.products
  end
  def show
    @product = Shop::Product.find_by_id(params[:id])
  end
  def new  
  	category = Shop::Category.find(params[:category_id])
    @product = Shop::Product.new(:category => category)
    category.cat_properties.each do |cat_prop|
#    	if cat_prop.datatype.code = ":integer"
#    		newPropValue = Shop::ProductPropValueInt.new
#    	else
#    		newPropValue = Shop::ProductPropValueStr.new	 
#    	end
    	newPropValue = Shop::ProductPropValue.new(:product_id=>@product.id,
    																    :cat_property_id=>cat_prop.id)
    	if newPropValue
#    		newPropValue.attributes = {:product_id=>@product.id,
#   																    :cat_property_id=>cat_prop.id}  			
    		@product.product_prop_values << newPropValue
    	end 
    end
  end
  def create
    @product = Shop::Product.new(params[:shop_product])
    if @product.save
      redirect_to :action => "index"
    else
      flash[:error] = @products.errors
      redirect_to :action => "new"
    end
  end
  def destroy
    @product = Shop::Product.find_by_id(params[:id])
    if @product
      @product.destroy
    end
    redirect_to :action => "index"
  end
  def update
    @product = Shop::Product.find_by_id(params[:id])
    @product.update_attributes(params[:shop_product])
    redirect_to :action => "edit"
  end
  def edit
    @product = Shop::Product.find_by_id(params[:id])
  end
end
