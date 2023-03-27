class HeroesController < ApplicationController
  def index
    @heroes = Hero.all
    render json: @heroes.to_json(only: [:id, :name, :super_name])
  end

  def show
    @hero = Hero.find_by(id: params[:id])

    if @hero
      render json: @hero.to_json(include: { powers: { only: [:id, :name, :description] } }, only: [:id, :name, :super_name])
    else
      render json: { error: "Hero not found" }, status: :not_found
    end
  end
end
