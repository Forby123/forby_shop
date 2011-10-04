class ::Shop::ProductPropValueInt < ::Shop::ProductPropValue
  def propvalue
  	self.value_int
  end
   def propvalue=(new_value)
  	self.value_int = new_value
  end
end
