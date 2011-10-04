# To change this template, choose Tools | Templates
# and open the template in the editor.
class ::Shop::CatPropertiesController < ApplicationController
  before_filter :authenticate_user!
  def create
    @cat_property = ::Shop::CatProperty.new
    @cat_property.update_attributes(params[:shop_cat_property])
    @cat_property.save
    category = ::Shop::Category.find(@cat_property.category_id)
    category.products.each do |product|
    	product.category.cat_properties.create(params[:shop_cat_property])
    end
    redirect_to :controller => :categories, :action =>:edit,
                :id=>@cat_property.category_id;
  end
  def destroy
    @cat_property = ::Shop::CatProperty.find(params['id']);
    @category_id = @cat_property.category_id
    @cat_property.destroy
    redirect_to :controller=> :categories, :action => :edit,
                :id=>@category_id
  end
end
