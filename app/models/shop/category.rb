# To change this template, choose Tools | Templates
# and open the template in the editor.

class ::Shop::Category < ::Shop::ShopActiveRecord  
  has_many    :products
  has_many    :cat_properties, :order =>:position
  acts_as_nested_set :order=>:name
  validates :name, :presence => true, :uniqueness => true  	  
  accepts_nested_attributes_for :cat_properties, :allow_destroy => true, 
  					:reject_if =>  proc { |attributes| attributes['name'].blank? }
end
