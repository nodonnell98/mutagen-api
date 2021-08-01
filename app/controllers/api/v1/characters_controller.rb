# frozen_string_literal: true

module Api
  module V1
    class CharactersController < ApplicationController
      before_action :set_character, only: %i[show update destroy]

      # GET /characters
      # GET /characters.json
      def index
        @characters = current_user.characters.all
      end

      # GET /characters/1
      # GET /characters/1.json
      def show; end

      # POST /characters
      # POST /characters.json
      def create
        @character = current_user.characters.new(character_params)

        if @character.save
          render :show, status: :created, location: api_v1_character_path(@character.id)
        else
          render json: @character.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /characters/1
      # PATCH/PUT /characters/1.json
      def update
        if @character.update(character_params)
          render :show, status: :ok, location: api_v1_character_path(@character.id)
        else
          render json: @character.errors, status: :unprocessable_entity
        end
      end

      # DELETE /characters/1
      # DELETE /characters/1.json
      def destroy
        @character.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_character
        @character = current_user.characters.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def character_params
        params.require(:character).permit(:name, :description, :id, :speed, :flying_speed, :health, :dodge, :might, :strength, :constitution, :discipline, :sense, :will, :charm, :intelligence, :strike, :mutation_points, :created_at, :updated_at, :weapon_ids => [])
      end
    end
  end
end
