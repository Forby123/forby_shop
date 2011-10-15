class Shop::CategoriesController < ApplicationController
before_filter :authenticate_user!
  def index
    @categories = Shop::Category.arrange
  end
  def show
    @category = Shop::Category.find_by_id(params[:id])
  end
  def new
    @category = Shop::Category.new
  	@datatypes = Shop::Datatype.all
    @category.cat_properties(:order => "position")
    @category.cat_properties.build    
  end
  def create
    @category = Shop::Category.new(params[:shop_category])
    if @category.save
      redirect_to :action => "index"
    else
      flash[:error] = @category.errors[0]
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
  def sort
  	category = Shop::Category.find(params[:category_id])
  	move_direction = params[:direction]
  	if move_direction=='left'
  		next_sib = category.left_sibling
  	else
  		next_sib = category.right_sibling  		
  	end	
  	if next_sib && category.same_scope?(next_sib)
  	 if move_direction=='left'
  			category.move_left
  		else
  		  category.move_right
  		end  
  		category.save
  	end
    redirect_to :action => "index"
	end  
  def edit
  	@datatypes = Shop::Datatype.all
    @category = Shop::Category.find_by_id(params[:id])
    @category.cat_properties(:order => "position")
    @category.cat_properties.build
  end
end
