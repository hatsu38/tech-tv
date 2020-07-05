# Rack-Cors
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.production?
      origins "https://connpass-tube-api.herokuapp.com/api/v1/events",
              "http://localhost:3000"
    else
      origins "*"
    end

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :head, :options]
  end
end