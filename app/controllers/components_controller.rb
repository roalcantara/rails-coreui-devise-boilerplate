# frozen_string_literal: true

class ComponentsController < ApplicationController
  before_action :set_component, only: %i[create show edit update destroy]
  before_action :set_breadcrumbs

  respond_to :html

  def index
    @q = Component.ransack(params[:q])
    @components = @q.result(distinct: true).includes(:created_by, :updated_by).order(created_at: :desc)

    respond_with(@components) do |format|
      format.html { @components = @components.page(@page).per(@per_page) }
      format.csv do
        render body: Component.to_csv(
          @components, %i[function kind group category name description created_by_email created_at]
        )
      end
    end
  end

  def show
    respond_with(@component)
  end

  def new
    @component = Component.new
    respond_with(@component)
  end

  def edit; end

  def create
    @component.save
    respond_with(@component)
  end

  def update
    @component.update(component_params)
    respond_with(@component)
  end

  def destroy
    @component.destroy
    respond_with(@component)
  end

  private

  def set_breadcrumbs
    set_breadcrumbs_for(Component, @component)
  end

  def set_component
    @component = params.key?(:id) ? Component.find(params[:id]) : Component.new(component_params)
  end

  def component_params
    params.require(:component).permit(:function, :kind, :group, :category, :name, :description)
          .reject! { |_key, value| value.strip.blank? }
  end
end
