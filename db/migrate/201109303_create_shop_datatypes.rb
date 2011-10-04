# encoding: utf-8
class CreateShopDatatypes < ActiveRecord::Migration
  def self.up
    create_table :shop_datatypes do |t|
      t.column    :name,        :string
      t.column    :code,        :string      
    end
    Shop::Datatype.create :name=>'число', :code=>'integer'
    Shop::Datatype.create :name=>'текст', :code=>'string'
  end

  def self.down
    drop_table :shop_datatypes
  end
end
