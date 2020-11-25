class Api::V1::BaseController < ApplicationController
  if Rails.env.production?
    rescue_from StandardError, with: :rescue_internal_error
    rescue_from ActionController::RoutingError, with: :rescue_not_found
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found
    rescue_from ActionController::UnknownFormat, with: :rescue_not_found
    rescue_from ActionView::MissingTemplate, with: :rescue_not_found
  end

  def rescue_not_found(error)
    Rails.logger.warn(
      "message: 404 NotFound #{request.url},
      #{error.message},
      #{error.class}"
    )
    Raven.extra_context(params: params&.to_unsafe_h, url: request.url)
    render json: { message: "not found", status: :not_found }
  end

  def rescue_internal_error(error)
    Rails.logger.error(
      "message: 500 InternalError #{request.url},
      #{error.message},
      #{error.class}"
    )
    Raven.extra_context(params: params&.to_unsafe_h, url: request.url)
    render json: { message: "internal error", status: 500 }
  end
end
