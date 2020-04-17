class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :update, :destroy]

  # GET /foods
  def index
    @foods = Food.all
    json_response(@foods)
  end

  # POST /foods
  def create
    @food = Food.create!(food_params)
    json_response(@food, :created)
  end

  # GET /foods/:id
  def show
    json_response(@food)
  end

  # PUT /foods/:id
  def update
    @food.update(food_params)
    head :no_content
  end

  # DELETE /foods/:id
  def destroy
    @food.destroy
    head :no_content
  end

  private

  def food_params
    # whitelist params
    params.permit(:name, :water_g, :energy_kcal, :protein_g, :lipid_tot_g, :ash_g, :carbohydrt_g, :fiber_td_g, :sugar_tot_g, :calcium_mg, :iron_mg, :magnesium_mg, :phosphorus_mg, :potassium_mg, :sodium_mg, :zinc_mg, :copper_mg, :manganese_mg, :selenium_µg, :vit_c_mg, :thiamin_mg, :riboflavin_mg, :niacin_mg, :panto_acid_mg, :vit_b6_mg, :folate_tot_µg, :folic_acid_µg, :food_folate_µg, :folate_dfe_µg, :choline_tot_mg, :vit_b12_µg, :vit_a_i, :vit_a_rae, :retinol_µg, :alpha_carot_µg, :beta_carot_µg, :beta_crypt_µg, :lycopene_µg, :lut_zea_µg, :vit_e_mg, :vit_d_µg, :vit_d_i, :vit_k_µg, :fa_sat_g, :fa_mono_g, :fa_poly_g, :cholestrl_mg, :gmwt, :gmwt_desc1)
  end

  def set_food
    @food = Food.select("foods.*")
                .where("foods.name ~* ?", params[:id]).uniq
  end
end
