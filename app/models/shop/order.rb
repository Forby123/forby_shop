# To change this template, choose Tools | Templates
# and open the template in the editor.

class ::Shop::Order < ::Shop::ShopActiveRecord
    has_many    :order_products
    belongs_to  :order_status
end
