class CreateShopOrders < ActiveRecord::Migration
  def self.up
    create_table :shop_orders do |t|
      t.column  :clientname,  				:string
      t.column  :ordertime,   				:datetime
      t.column  :address,     				:string
      t.column  :phone,       				:string
      t.column  :comment,     				:string
      t.column  :shop_order_status_id,:integer     
    end
  end

  def self.down
    drop_table :shop_orders
  end
end
