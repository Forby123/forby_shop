# To change this template, choose Tools | Templates
# and open the template in the editor.

class ::Shop::OrderProduct < ::Shop::ShopActiveRecord
  belongs_to :order
  belongs_to :product
end
