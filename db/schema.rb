# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_15_203005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.date "date"
    t.integer "water"
    t.string "note"
    t.bigint "diary_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["diary_id"], name: "index_days_on_diary_id"
  end

  create_table "diaries", force: :cascade do |t|
    t.string "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_diaries_on_user_id"
  end

  create_table "food_days", force: :cascade do |t|
    t.integer "meal"
    t.bigint "food_id", null: false
    t.bigint "day_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_id"], name: "index_food_days_on_day_id"
    t.index ["food_id"], name: "index_food_days_on_food_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "water_g"
    t.string "energy_kcal"
    t.string "protein_g"
    t.string "lipid_tot_g"
    t.string "ash_g"
    t.string "carbohydrt_g"
    t.string "fiber_td_g"
    t.string "sugar_tot_g"
    t.string "calcium_mg"
    t.string "iron_mg"
    t.string "magnesium_mg"
    t.string "phosphorus_mg"
    t.string "potassium_mg"
    t.string "sodium_mg"
    t.string "zinc_mg"
    t.string "copper_mg"
    t.string "manganese_mg"
    t.string "selenium_µg"
    t.string "vit_c_mg"
    t.string "thiamin_mg"
    t.string "riboflavin_mg"
    t.string "niacin_mg"
    t.string "panto_acid_mg"
    t.string "vit_b6_mg"
    t.string "folate_tot_µg"
    t.string "folic_acid_µg"
    t.string "food_folate_µg"
    t.string "folate_dfe_µg"
    t.string "choline_tot_mg"
    t.string "vit_b12_µg"
    t.string "vit_a_i"
    t.string "vit_a_rae"
    t.string "retinol_µg"
    t.string "alpha_carot_µg"
    t.string "beta_carot_µg"
    t.string "beta_crypt_µg"
    t.string "lycopene_µg"
    t.string "lut_zea_µg"
    t.string "vit_e_mg"
    t.string "vit_d_µg"
    t.string "vit_d_i"
    t.string "vit_k_µg"
    t.string "fa_sat_g"
    t.string "fa_mono_g"
    t.string "fa_poly_g"
    t.string "cholestrl_mg"
    t.string "gmwt"
    t.string "gmwt_desc1"
  end

  create_table "posts", force: :cascade do |t|
    t.string "content"
    t.string "photo"
    t.string "user_id"
    t.integer "likes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.string "follower_id"
    t.string "followed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "sport_days", force: :cascade do |t|
    t.integer "hour"
    t.bigint "sport_id", null: false
    t.bigint "day_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_id"], name: "index_sport_days_on_day_id"
    t.index ["sport_id"], name: "index_sport_days_on_sport_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.string "calories"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", id: :string, force: :cascade do |t|
    t.string "username", null: false
    t.string "photo_profile"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "weights", force: :cascade do |t|
    t.string "weight"
    t.string "photo"
    t.string "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_weights_on_user_id"
  end

  add_foreign_key "days", "diaries"
  add_foreign_key "food_days", "days"
  add_foreign_key "food_days", "foods"
  add_foreign_key "sport_days", "days"
  add_foreign_key "sport_days", "sports"
end
