# frozen_string_literal: true

require 'application_responder'

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  before_action :set_page, only: %i[index]
  before_action :set_per_page, only: %i[index]
  before_action :authenticate_user!
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
end
