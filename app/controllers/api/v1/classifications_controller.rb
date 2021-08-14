# frozen_string_literal: true

module Api
  module V1
    class ClassificationsController < ApplicationController
      before_action :set_classification, only: %i[show update destroy]

      # GET /classifications
      # GET /classifications.json
      def index
        @classifications = Classification.order(name: :asc).all
      end

      # GET /classifications/1
      # GET /classifications/1.json
      def show;
        render json: @classification
      end

      # POST /classifications
      # POST /classifications.json
      def create
        @classification = Classification.new(classification_params)

        if @classification.save
          render :show, status: :created, location: api_v1_classification_path(@classification.id)
        else
          render json: @classification.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /classifications/1
      # PATCH/PUT /classifications/1.json
      def update
        if @classification.update(classification_params)
          render :show, status: :ok, location: api_v1_classification_path(@classification.id)
        else
          render json: @classification.errors, status: :unprocessable_entity
        end
      end

      # DELETE /classifications/1
      # DELETE /classifications/1.json
      def destroy
        @classification.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_classification
        @classification = Classification.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def classification_params
        params.require(:classification).permit(:name, :description, :id, :strike_stat, :might_stat, :dodge_stat, :gene_pool, :character_ids => [])
      end
    end
  end
end
