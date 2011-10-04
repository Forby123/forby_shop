class CreateShopProducts < ActiveRecord::Migration
  def self.up
    create_table :shop_products do |t|
        t.column  :name,         :string
        t.column  :about,        :string
        t.column  :price,        :integer
        t.column  :category_id,  :integer
    end
  end

  def self.down
    drop_table :shop_products
  end
end
