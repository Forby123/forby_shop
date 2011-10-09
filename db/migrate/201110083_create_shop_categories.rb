class CreateShopCategories < ActiveRecord::Migration
  def change
  	drop_table :shop_categories
    create_table :shop_categories do |t|
      t.string  :name
      t.string  :comment
      t.integer :parent_id
    	t.integer :lft
      t.integer :rgt      
    end
  end
end
