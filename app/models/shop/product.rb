# To change this template, choose Tools | Templates
# and open the template in the editor.

class ::Shop::Product < ::Shop::ShopActiveRecord
    belongs_to  :category    	            
    has_many	  :product_prop_values, :include=>:cat_property, :order=>'shop_cat_properties.position'
 	  accepts_nested_attributes_for :product_prop_values
end
