# To change this template, choose Tools | Templates
# and open the template in the editor.

class ::Shop::CatProperty < ::Shop::ShopActiveRecord
  belongs_to      :category
  belongs_to   		:datatype
  acts_as_list    :scope => :category
  validates :name, :presence => true
end
