class ::Shop::ProductPropValueStr < ::Shop::ProductPropValue
  def propvalue
  	self.value_str
  end
  def propvalue=(new_value)
  	self.value_str = new_value
  end
end
