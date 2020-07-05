# Rack-Cors
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.production?
      origins "http://localhost:3000",
              "https://connpass-tube.web.app"
    else
      origins "*"
    end

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :head, :options]
  end
end