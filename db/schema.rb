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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_16_112721) do

  create_table "admin_plugins", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "slug"
    t.integer "hits", default: 0
    t.string "image"
    t.integer "user_id"
    t.integer "category_id"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["site_id"], name: "index_articles_on_site_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "cart_products", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "product_id"
    t.integer "quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_products_on_cart_id"
    t.index ["product_id"], name: "index_cart_products_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.string "template"
    t.integer "order_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_carts_on_order_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "articles_count", default: 0
    t.index ["site_id"], name: "index_categories_on_site_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "extension_plugins", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.integer "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tab_id"
    t.index ["tab_id"], name: "index_menus_on_tab_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "price", precision: 6, scale: 2
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "orders_products", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.index ["order_id"], name: "index_orders_products_on_order_id"
    t.index ["product_id"], name: "index_orders_products_on_product_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "type"
    t.integer "menu_id"
    t.integer "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_pages_on_menu_id"
    t.index ["template_id"], name: "index_pages_on_template_id"
  end

  create_table "plugins", force: :cascade do |t|
    t.boolean "is_activated", default: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "site_id"
    t.integer "extension_plugin_id"
    t.index ["extension_plugin_id"], name: "index_plugins_on_extension_plugin_id"
    t.index ["site_id"], name: "index_plugins_on_site_id"
  end

  create_table "plugins_sites", force: :cascade do |t|
    t.integer "plugin_id"
    t.integer "site_id"
    t.index ["plugin_id"], name: "index_plugins_sites_on_plugin_id"
    t.index ["site_id"], name: "index_plugins_sites_on_site_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.integer "sale", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "slogan"
    t.string "meta_description"
    t.string "meta_title"
    t.integer "user_id"
    t.integer "template_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sites_on_category_id"
    t.index ["template_id"], name: "index_sites_on_template_id"
    t.index ["user_id"], name: "index_sites_on_user_id"
  end

  create_table "sites_templates", force: :cascade do |t|
    t.integer "site_id"
    t.integer "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_sites_templates_on_site_id"
    t.index ["template_id"], name: "index_sites_templates_on_template_id"
  end

  create_table "tabs", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.integer "order"
    t.integer "site_id"
    t.string "item_type"
    t.integer "item_id"
    t.boolean "home"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_type", "item_id"], name: "index_tabs_on_item_type_and_item_id"
    t.index ["site_id"], name: "index_tabs_on_site_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "logo"
    t.boolean "purchased"
    t.integer "site_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_templates_on_product_id"
    t.index ["site_id"], name: "index_templates_on_site_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "avatar"
    t.string "role"
    t.integer "cart_id"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_users_on_cart_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["site_id"], name: "index_users_on_site_id"
  end

end
