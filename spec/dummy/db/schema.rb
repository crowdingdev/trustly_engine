# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20140227092254) do

  create_table "trustly_engine_requests", :force => true do |t|
    t.string   "method"
    t.string   "uuid"
    t.text     "signature"
    t.integer  "user_id"
    t.string   "locale"
    t.string   "country"
    t.decimal  "amount"
    t.string   "currency"
    t.string   "ip"
    t.string   "phone_number"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nin"
    t.string   "address"
    t.integer  "status_id",         :default => 0
    t.string   "order_id"
    t.string   "request_timestamp"
    t.string   "message_id"
    t.string   "notification_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "trustly_engine_results", :force => true do |t|
    t.text     "signature"
    t.string   "uuid"
    t.string   "method"
    t.string   "order_id"
    t.string   "result"
    t.string   "url"
    t.integer  "request_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
