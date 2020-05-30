# frozen_string_literal: true

class ApplicationController < ActionController::Base
  module ErrorResponses
    protected

    def bad_request!(error_messages)
      render json: { error_messages: error_messages }, status: 400
    end

    def deny_request!(error_messages)
      respond_to do |format|
        format.json { render json: { error_messages: error_messages }, status: 401 }
        format.pdf  { render json: { error_messages: error_messages }, status: 401 }
        format.csv  { render json: { error_messages: error_messages }, status: 401 }
        format.html { redirect_to '/', alert: error_messages }
      end
    end

    def forbid_request!(error_messages)
      respond_to do |format|
        format.json { render json: { error_messages: error_messages }, status: 403 }
        format.pdf  { render json: { error_messages: error_messages }, status: 403 }
        format.csv  { render json: { error_messages: error_messages }, status: 403 }
        format.html { redirect_to '/', alert: error_messages }
      end
    end

    def not_found!(error_messages)
      render json: { error_messages: error_messages }, status: 404
    end

    def user_signed_in_required
      unless user_signed_in?
        respond_to do |format|
          format.json { deny_access! "You're not authorized" }
          format.pdf  { deny_access! "You're not authorized" }
          format.csv  { deny_access! "You're not authorized" }
        end
      end
    end
  end
end
