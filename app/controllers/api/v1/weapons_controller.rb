# frozen_string_literal: true

module Api
  module V1
    class WeaponsController < ApiController
      before_action :set_weapon, only: %i[show update destroy]

      # GET /weapons
      def index
        @weapons = Weapon.all
      end

      # GET /weapons/1
      def show
        render json: @weapon
      end

      # POST /weapons
      def create
        @weapon = Weapon.new(weapon_params)

        if @weapon.save
          render :show, status: :created
        else
          render json: @weapon.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /weapons/1
      def update
        if @weapon.update(weapon_params)
          render json: @weapon
        else
          render json: @weapon.errors, status: :unprocessable_entity
        end
      end

      # DELETE /weapons/1
      def destroy
        @weapon.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_weapon
        @weapon = Weapon.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def weapon_params
        params.require(:weapon).permit(:name, :weapon_type, :description, :range, :quality, :dice_type, :dice_qty,
                                       :proficiency, :ammo, :damage_type)
      end
    end
  end
end
