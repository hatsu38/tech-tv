class ApplicationController < ActionController::Base

  if Rails.env.production?
    rescue_from StandardError, with: :rescue_500
    rescue_from ActionController::RoutingError, with: :rescue_404
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_404
  end

  private

  def rescue_404(e)
    Rails.logger.warn(
      "message: 404 NotFound #{request.url},
      #{e.message},
      #{e.class}"
    )
    render json: { message: "not found", status: 404 }
  end

  def rescue_500(e)
    Rails.logger.error(
      "message: 500 InternalError #{request.url},
      #{e.message},
      #{e.class}"
    )

    render json: { message: "internal error", status: 500 }
  end
end
