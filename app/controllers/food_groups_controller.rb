# frozen_string_literal: true

class FoodGroupsController < ApplicationController
  before_action :set_food_group, only: %i[create show edit update destroy]
  before_action :set_breadcrumbs

  def index
    @q = FoodGroup.ransack(params[:q])
    @food_groups = @q.result(distinct: true).includes(:created_by, :updated_by).order(created_at: :desc)

    respond_with(@food_groups) do |format|
      format.html { @food_groups = @food_groups.page(@page).per(@per_page) }
      format.csv { render body: FoodGroup.to_csv(@food_groups, %i[name description created_by_email created_at]) }
    end
  end

  def show
    respond_with(@food_group)
  end

  def new
    @food_group = FoodGroup.new
    respond_with(@food_group)
  end

  def edit; end

  def create
    @food_group.save
    respond_with(@food_group)
  end

  def update
    @food_group.update(food_group_params)
    respond_with(@food_group)
  end

  def destroy
    @food_group.destroy
    respond_with(@food_group)
  end

  private

  def set_breadcrumbs
    set_breadcrumbs_for(FoodGroup, @food_group)
  end

  def set_food_group
    @food_group = params.key?(:id) ? FoodGroup.find(params[:id]) : FoodGroup.new(food_group_params)
  end

  def food_group_params
    params.require(:food_group).permit(:name, :description)
  end
end
