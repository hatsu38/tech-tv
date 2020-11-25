class ApplicationController < ActionController::Base
  before_action :ensure_domain

  FQDN = "www.tech-tv.site".freeze
  # redirect correct server from herokuapp domain for SEO
  # www.tech-tv.siteへリダイレクトさせる
  def ensure_domain
    if request.host == "tech-tv.site" || /\.herokuapp.com/ =~ request.host
      # 主にlocalテスト用の対策80と443以外でアクセスされた場合ポート番号をURLに含める
      port = ":#{request.port}" unless [80, 443].include?(request.port)
      redirect_to "#{request.protocol}#{FQDN}#{port}#{request.path}", status: :moved_permanently
    end
  end

  if Rails.env.production?
    rescue_from StandardError, with: :rescue_internal_error
    rescue_from ActionController::RoutingError, with: :rescue_not_found
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found
    rescue_from ActionController::UnknownFormat, with: :rescue_not_found
    rescue_from ActionView::MissingTemplate, with: :rescue_not_found
    rescue_from ActionController::RoutingError, with: :rescue_not_found
  end

  def rescue_not_found(e = nil)
    Rails.logger.warn(
      "message: 404 NotFound #{request.url},
      #{e&.message},
      #{e&.class}"
    )
    Raven.extra_context(params: params&.to_unsafe_h, url: request.url)
    render "errors/404.html.erb", status: :not_found
  end

  def rescue_internal_error(e = nil)
    Rails.logger.error(
      "message: 500 InternalError #{request.url},
      #{e&.message},
      #{e&.class}"
    )
    Raven.extra_context(params: params&.to_unsafe_h, url: request.url)
    render "errors/500.html.erb", status: :internal_server_error
  end
end
