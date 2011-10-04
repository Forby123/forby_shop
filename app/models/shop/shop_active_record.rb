# To change this template, choose Tools | Templates
# and open the template in the editor.

class ::Shop::ShopActiveRecord < ActiveRecord::Base
  self.table_name_prefix = "shop_"
  self.abstract_class = true
end

