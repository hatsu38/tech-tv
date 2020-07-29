# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://connpass-tube.hatsu38.com/"
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET_NAME']}"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  ENV['S3_BUCKET_NAME'],
  aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  aws_region: 'ap-northeast-1'
)

SitemapGenerator::Sitemap.create do
  add root_path
  Event.find_each do |event|
    add event_path(event), lastmod: event.updated_at
  end

  Tag.find_each do |tag|
    add tag_path(tag), lastmod: tag.updated_at
  end
end
