# To change this template, choose Tools | Templates
# and open the template in the editor.

class Shop::CategoriesController < ApplicationController
before_filter :authenticate_user!
  def index
    @categories = Shop::Category.all
  end
  def show
    @category = Shop::Category.find_by_id(params[:id])
  end
  def new
    @category = Shop::Category.new
  end
  def create
    @category = Shop::Category.new(params[:category])
    if @category.save
      redirect_to :action => "index"
    else
      flash[:error] = @category.errors
      redirect_to :action => "new"
    end
  end
  def destroy
    @category = Shop::Category.find_by_id(params[:id])
    if @category
      @category.destroy
    end
    redirect_to :action => "index"
  end
  def update
    @category = Shop::Category.find_by_id(params[:id])
    @category.attributes = params[:shop_category]
    @category.cat_properties.each do|prop|
			if prop.new_record?
	   		prop.save
    		@category.products.each do |product|
#    			 if prop.datatype.code = ":integer"
#    		  	 newPropValue = Shop::ProductPropValueInt.new
#    		   else
#    		   	 newPropValue = Shop::ProductPropValueStr.new	 
#    		   end
    		   newPropValue = Shop::ProductPropValue.new(:product_id=>product.id,
    																                 :cat_property_id=>prop.id)
    		   if newPropValue
    				 newPropValue.save    			
    			 end 
    		end
    	end	
    	if prop._destroy then
    		prop_values = Shop::ProductPropValue.find_all_by_cat_property_id(prop.id)
    		if prop_values
    			prop_values.each do |prop_value| 
    				prop_value.destroy    		
    			end
    		end	
    	end
    end
    if @category.save
    	redirect_to :action => "edit"
    else
    	flash[:error] = @category.errors
    end	
  end
  def update_position
		params[:sortlist].each_index do |i|
    	cat_property = Shop::CatProperty.find(params[:sortlist][i])
    	cat_property.position = i
    	cat_property.save
    end
		render :nothing => true
	end
  def edit
  	@datatypes = Shop::Datatype.all
    @category = Shop::Category.find_by_id(params[:id])
    @category.cat_properties(:order => "position")
    @category.cat_properties.build
  end
end
