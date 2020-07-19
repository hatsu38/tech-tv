class ApplicationController < ActionController::Base

  if Rails.env.production?
    rescue_from StandardError, with: :rescue_500
    rescue_from ActionController::RoutingError, with: :rescue_404
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_404
    rescue_from ActionController::UnknownFormat, with: :rescue_404
    rescue_from ActionView::MissingTemplate, with: :rescue_404
    rescue_from ActionController::RoutingError, with: :render_404
  end

  def rescue_404(e = nil)
    Rails.logger.warn(
      "message: 404 NotFound #{request.url},
      #{e&.message},
      #{e&.class}"
    )
    Raven.extra_context(params: params&.to_unsafe_h, url: request.url)
    render 'errors/404.html.erb', status: 404
  end

  def rescue_500(e = nil)
    Rails.logger.error(
      "message: 500 InternalError #{request.url},
      #{e&.message},
      #{e&.class}"
    )
    Raven.extra_context(params: params&.to_unsafe_h, url: request.url)
    render 'errors/500.html.erb', status: 500
  end
end
