class CreateShopOrderProducts < ActiveRecord::Migration
  def self.up  	
    create_table :shop_order_products do |t|
      t.column  :shop_order_id,      :integer
      t.column  :shop_product_id,    :integer
      t.column  :count,         :integer
      t.column  :price,         :integer
    end
  end

  def self.down
    drop_table :shop_order_products
  end
end
