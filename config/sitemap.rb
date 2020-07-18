# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://connpass-tube.herokuapp.com/"

SitemapGenerator::Sitemap.create do
  add root_path
  Event.find_each do |event|
    add event_path(event), lastmod: event.updated_at
  end

  Tag.find_each do |tag|
    add tag_path(tag), lastmod: tag.updated_at
  end
end
