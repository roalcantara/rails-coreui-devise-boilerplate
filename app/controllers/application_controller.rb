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
end
