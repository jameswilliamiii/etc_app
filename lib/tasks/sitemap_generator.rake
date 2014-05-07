require 'aws'
require 'rake'

class Rake::Task
  def replace &block
    @actions.clear
    prerequisites.clear
    enhance &block
  end
end

namespace 'sitemap' do
  desc 'Upload the sitemap files to S3 (using your S3 ENV vars)'
  task :upload_to_s3 => :environment do

    # Load credentials
    s3_options = {
                  access_key_id: ENV['S3_ACCESS_KEY'],
                  secret_access_key: ENV['S3_SECRET_ACCESS_KEY']
                 }
    bucket_name = ENV['S3_BUCKET']

    # Establish S3 connection
    AWS.config(s3_options)

    Dir.entries(File.join(Rails.root, "public", "sitemaps")).each do |file_name|
      next if ['.', '..'].include? file_name
      path = "sitemaps/#{file_name}"
      file = File.join(Rails.root, "public", "sitemaps", file_name)

      begin
        s3 = AWS::S3.new
        bucket = s3.buckets.create(bucket_name)


        object = bucket.objects[path]
        object.write(:file => file)
      rescue Exception => e
        raise
      end
      puts "Saved #{file_name} to S3"
    end
  end
end

Rake::Task[:"sitemap:create"].enhance do
  Rake::Task["sitemap:upload_to_s3"].invoke
end

Rake::Task[:'sitemap:refresh'].replace do
  s3_options = {
                access_key_id: ENV['S3_ACCESS_KEY'],
                secret_access_key: ENV['S3_SECRET_ACCESS_KEY']
               }
  bucket_name = ENV['S3_BUCKET']
  SitemapGenerator::Sitemap.ping_search_engines(:sitemap_index_url => "https://#{bucket_name}.s3.amazonaws.com/sitemaps/sitemap_index.xml.gz")
end