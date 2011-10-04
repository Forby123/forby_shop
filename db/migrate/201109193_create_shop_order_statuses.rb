class CreateShopOrderStatuses < ActiveRecord::Migration
  def self.up
    create_table :shop_order_statuses do |t|
      t.column  :name,         	:string      
      t.column  :comment,       :string
      t.column  :key,						:string
      t.column  :system,				:boolean
    end
  end

  def self.down
    drop_table :shop_order_statuses
  end
end
