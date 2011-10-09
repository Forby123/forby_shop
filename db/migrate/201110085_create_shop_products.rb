class CreateShopProducts < ActiveRecord::Migration
  def change
    drop_table :shop_products
    create_table :shop_products do |t|
        t.string  	:name
        t.text  		:about
        t.integer  	:price
        t.integer  	:category_id
    end
  end

  def self.down
    drop_table :shop_products
  end
end
