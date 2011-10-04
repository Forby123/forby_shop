class CreateShopProductPropValues < ActiveRecord::Migration
  def self.up
    create_table :shop_product_prop_values do |t|
      t.column    :product_id,              :integer
      t.column    :cat_property_id,     		:integer, :null => false
      t.column    :value_str,               :string
      t.column    :value_int,               :integer
      t.column    :value_date,              :date      
    end
  end

  def self.down
    drop_table :shop_product_prop_values
  end
end
