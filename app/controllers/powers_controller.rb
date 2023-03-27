# app/controllers/powers_controller.rb
class PowersController < ApplicationController
  def index
    @powers = Power.all
    render json: @powers.to_json(only: [:id, :name, :description])
  end

  def show
    @power = Power.find_by(id: params[:id])

    if @power
      render json: @power.to_json(only: [:id, :name, :description])
    else
      render json: { error: "Power not found" }, status: :not_found
    end
  end

  def update
    @power = Power.find_by(id: params[:id])

    if @power
      if @power.update(power_params)
        render json: @power.to_json(only: [:id, :name, :description])
      else
        render json: { errors: @power.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Power not found" }, status: :not_found
    end
  end

  def hero_powers
    @hero_power = HeroPower.new(hero_power_params)

    if @hero_power.save
      @hero = @hero_power.hero
      render json: @hero.to_json(include: { powers: { methods: [:power_description] } }), status: :created, location: @hero
    else
      render json: @hero_power.errors, status: :unprocessable_entity
    end
  end

    private

    def hero_power_params
    params.require(:hero_power).permit(:hero_id, :power_id)
    end
  end
