class ApplicationController < ActionController::Base

  before_action :ensure_domain

  FQDN = 'www.tech-tv.site'
  # redirect correct server from herokuapp domain for SEO
  # www.tech-tv.siteへリダイレクトさせる
  def ensure_domain
    if "tech-tv.site" == request.host || /\.herokuapp.com/ =~ request.host
      # 主にlocalテスト用の対策80と443以外でアクセスされた場合ポート番号をURLに含める
      port = ":#{request.port}" unless [80, 443].include?(request.port)
      redirect_to "#{request.protocol}#{FQDN}#{port}#{request.path}", status: :moved_permanently
    end
  end

  if Rails.env.production?
    rescue_from StandardError, with: :rescue_500
    rescue_from ActionController::RoutingError, with: :rescue_404
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_404
    rescue_from ActionController::UnknownFormat, with: :rescue_404
    rescue_from ActionView::MissingTemplate, with: :rescue_404
    rescue_from ActionController::RoutingError, with: :rescue_404
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
