# frozen_string_literal: true

require 'application_responder'

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  before_action :set_page, only: %i[index]
  before_action :set_per_page, only: %i[index]
  before_action :authenticate_user!
  before_action :set_userstamp
  layout :layout_by_resource

  def set_breadcrumbs_for(model_class, model)
    @crumbs = [{ name: 'Home', url: root_path }]
    @crumbs << { name: model_class.model_name.human.pluralize, url: index_path }
    @crumbs << { name: "##{model.id}", url: url_for(model) } if model.present? && model.persisted?
    add_actions_breadcrumbs
  end

  private

  def set_page
    @page = params[:page] || 1
  end

  def set_per_page
    @per_page = params[:per_page] || 10
  end

  def layout_by_resource
    devise_controller? && !user_signed_in? ? 'plain' : 'application'
  end

  def set_userstamp
    User.current_user = User.find(current_user.id) if user_signed_in?
  end

  def index_path
    url_for(action: :index, controller: controller_name)
  end

  def add_actions_breadcrumbs
    @crumbs << I18n.t('actions.edit', name: '') if %i[edit update].include?(action_name.to_sym)
    @crumbs << I18n.t('actions.new', name: '') if %i[new create].include?(action_name.to_sym)
  end
end
