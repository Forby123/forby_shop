# To change this template, choose Tools | Templates
# and open the template in the editor.

class ::Shop::Product < ::Shop::ShopActiveRecord
    belongs_to  :category
    has_many 		:product_prop_values
 	  accepts_nested_attributes_for :product_prop_values, :reject_if => :all_blank
end
