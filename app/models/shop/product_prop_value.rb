class ::Shop::ProductPropValue < ::Shop::ShopActiveRecord
  belongs_to  :product
  belongs_to  :cat_property
  
  def propvalue
  	if self.cat_property.datatype.code == ":integer"
  		self.value_int
  	else
  		self.value_str
  	end	
  end
  def propvalue=(new_value)
  	if self.cat_property.datatype.code == ":integer"
  		self.value_int = new_value
  	else
  		self.value_str = new_value
  	end  
  end  
end
