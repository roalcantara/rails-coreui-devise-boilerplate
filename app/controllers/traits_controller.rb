# frozen_string_literal: true

class TraitsController < ApplicationController
  before_action :set_trait, only: %i[create show edit update destroy]
  before_action :set_breadcrumbs

  def index
    @q = Trait.ransack(params[:q])
    @traits = @q.result(distinct: true).includes(:created_by, :updated_by).order(created_at: :desc)

    respond_with(@traits) do |format|
      format.html { @traits = @traits.page(@page).per(@per_page) }
      format.csv { render body: Trait.to_csv(@traits, %i[kind title created_by_email created_at]) }
    end
  end

  def show
    respond_with(@trait)
  end

  def new
    @trait = Trait.new
    respond_with(@trait)
  end

  def edit; end

  def create
    @trait.save
    respond_with(@trait)
  end

  def update
    @trait.update(trait_params)
    respond_with(@trait)
  end

  def destroy
    @trait.destroy
    respond_with(@trait)
  end

  private

  def set_breadcrumbs
    set_breadcrumbs_for(Trait, @trait)
  end

  def set_trait
    @trait = params.key?(:id) ? Trait.find(params[:id]) : Trait.new(trait_params)
  end

  def trait_params
    params.require(:trait).permit(:title, :kind)
  end
end
