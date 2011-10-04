class ::Shop::ProductPropertiesController < ApplicationController
  def index
  	@properties = Shop::Product_prop_value.all
  end
end
