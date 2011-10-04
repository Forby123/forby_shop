class CreateShopCatProperties < ActiveRecord::Migration
  def self.up
    create_table :shop_cat_properties do |t|
      t.column    :name,              :string
      t.column    :comment,           :string
      t.column    :default_value,     :string
      t.column		:position,					:integer
      t.column		:datatype_id,	      :integer
      t.column    :category_id,       :integer
    end
  end

  def self.down
    drop_table :shop_cat_properties
  end
end
