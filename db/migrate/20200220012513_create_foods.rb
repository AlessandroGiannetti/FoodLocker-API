class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :water_g
      t.string :energy_kcal
      t.string :protein_g
      t.string :lipid_tot_g
      t.string :ash_g
      t.string :carbohydrt_g
      t.string :fiber_td_g
      t.string :sugar_tot_g
      t.string :calcium_mg
      t.string :iron_mg
      t.string :magnesium_mg
      t.string :phosphorus_mg
      t.string :potassium_mg
      t.string :sodium_mg
      t.string :zinc_mg
      t.string :copper_mg
      t.string :manganese_mg
      t.string :selenium_µg
      t.string :vit_c_mg
      t.string :thiamin_mg
      t.string :riboflavin_mg
      t.string :niacin_mg
      t.string :panto_acid_mg
      t.string :vit_b6_mg
      t.string :folate_tot_µg
      t.string :folic_acid_µg
      t.string :food_folate_µg
      t.string :folate_dfe_µg
      t.string :choline_tot_mg
      t.string :vit_b12_µg
      t.string :vit_a_i
      t.string :vit_a_rae
      t.string :retinol_µg
      t.string :alpha_carot_µg
      t.string :beta_carot_µg
      t.string :beta_crypt_µg
      t.string :lycopene_µg
      t.string :lut_zea_µg
      t.string :vit_e_mg
      t.string :vit_d_µg
      t.string :vit_d_i
      t.string :vit_k_µg
      t.string :fa_sat_g
      t.string :fa_mono_g
      t.string :fa_poly_g
      t.string :cholestrl_mg
      t.string :gmwt
      t.string :gmwt_desc1
    end
  end
end
