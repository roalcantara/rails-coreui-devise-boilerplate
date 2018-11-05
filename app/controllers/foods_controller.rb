# frozen_string_literal: true

class FoodsController < ApplicationController
  before_action :set_food, only: %i[create show edit update destroy]
  before_action :set_breadcrumbs

  def index
    @q = Food.ransack(params[:q])
    @foods = @q.result(distinct: true).includes(:food_group, :created_by, :updated_by).order(created_at: :desc)

    respond_with(@foods) do |format|
      format.html { @foods = @foods.page(@page).per(@per_page) }
      format.csv do
        render body: FoodGroup.to_csv(@foods, %i[food_group_name name description created_by_email created_at])
      end
    end
  end

  def show
    respond_with @food
  end

  def new
    @food = Food.new
    respond_with @food
  end

  def edit; end

  def create
    @food.save
    respond_with @food
  end

  def update
    @food.update food_params
    respond_with @food
  end

  def destroy
    @food.destroy
    respond_with @food
  end

  private

  def set_breadcrumbs
    set_breadcrumbs_for(Food, @food)
  end

  def set_food
    @food = params.key?(:id) ? Food.find(params[:id]) : Food.new(food_params)
  end

  def food_params
    params.require(:food).permit(:food_group_id, :name, :description)
  end
end
