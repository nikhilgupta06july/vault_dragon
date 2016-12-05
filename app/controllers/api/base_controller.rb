class Api::BaseController < ApplicationController
  protect_from_forgery

  before_action :authenticate_api
  before_action :set_language

  def authenticate_api


    if current_user.present?

      return
    end
    #render json: current_user and return
    authenticate_user_from_token!

  end

  def set_language
    begin
      I18n.locale = params[:locale] if params[:locale]
      # set time zone
      old_time_zone = Time.zone
      timezone = current_user.try(:country).try(:time_zone)
      #render json: timezone and return
      if timezone.present?
        Time.zone = timezone
        config.time_zone = timezone
      else
        Time.zone = old_time_zone
        config.time_zone = old_time_zone
      end

    rescue
      I18n.locale = :en

    end
    #render json: config.time_zone and return
    $locale = I18n.locale
  end

  private

  def authenticate_user_from_token!


      user_token = params[:user_token].presence
      @user = User.find_by_authentication_token(user_token.to_s) if user_token.present?
      if @user.present?
        if current_user.try(:id) != @user.try(:id) || current_user.nil?
          sign_out(@user)
          sign_in(@user)
        end

      else
        render status: 403, :text => t(:unauthenticated)
      end




  end
end
