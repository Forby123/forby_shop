class CreateShopCategories < ActiveRecord::Migration
  def self.up
    create_table :shop_categories do |t|
      t.column  :name,  :string
      t.column  :comment, :string
    end
  end

  def self.down
    drop_table :shop_categories
  end
end
