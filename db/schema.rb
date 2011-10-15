# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110911110817) do

  create_table "shop_cat_properties", :force => true do |t|
    t.string  "name"
    t.string  "comment"
    t.string  "default_value"
    t.integer "position"
    t.integer "datatype_id"
    t.integer "category_id"
  end

  create_table "shop_categories", :force => true do |t|
    t.string "name"
    t.string "comment"
  end

  create_table "shop_datatypes", :force => true do |t|
    t.string "name"
    t.string "code"
  end

  create_table "shop_order_products", :force => true do |t|
    t.integer "shop_order_id"
    t.integer "shop_product_id"
    t.integer "count"
    t.integer "price"
  end

  create_table "shop_order_statuses", :force => true do |t|
    t.string  "name"
    t.string  "comment"
    t.boolean "system"
  end

  create_table "shop_orders", :force => true do |t|
    t.string   "clientname"
    t.datetime "ordertime"
    t.string   "address"
    t.string   "phone"
    t.string   "comment"
    t.integer  "shop_order_status_id"
  end

  create_table "shop_product_prop_values", :force => true do |t|
    t.integer "product_id"
    t.integer "cat_property_id", :null => false
    t.string  "value_str"
    t.integer "value_int"
    t.date    "value_date"
  end

  create_table "shop_products", :force => true do |t|
    t.string  "name"
    t.string  "about"
    t.integer "price"
    t.integer "category_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "phone"
    t.string   "address"
    t.string   "add_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
