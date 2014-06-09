# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.elgintech.org/"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.sitemaps_host = "https://#{ENV['S3_BUCKET']}.s3.amazonaws.com/"
SitemapGenerator::Sitemap.create do
  add home_path
  add user_root_path
  add events_path
  add classes_path
  add apply_path
  add class_registration_path
  add profiles_path

  Profile.all.each do |profile|
    add profile_path(profile), lastmod: profile.updated_at
  end

  ClassOffer.active.each do |class_offer|
    add class_path(class_offer), lastmod: class_offer.updated_at
  end


  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end