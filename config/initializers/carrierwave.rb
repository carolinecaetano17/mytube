CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = 'mytubevideo'
  config.aws_acl    = 'public-read'

  # Optionally define an asset host for configurations that are fronted by a
  # content host, such as CloudFront.
  #config.asset_host = 'http://example.com'

  # The maximum period for authenticated_urls is only 7 days.
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

  # Set custom options such as cache control to leverage browser caching
  config.aws_attributes = {
    expires: 1.week.from_now.httpdate,
    cache_control: 'max-age=604800'
  }

  config.aws_credentials = {
    access_key_id:     ENV.fetch('S3_KEY'),
    secret_access_key: ENV.fetch('S3_SECRET'),
    region:            'sa-east-1' # Required
  }

  # Optional: Signing of download urls, e.g. for serving private
  # content through CloudFront.
  # config.aws_signer = -> (unsigned_url, options) { Aws::CF::Signer.sign_url unsigned_url, options }
end
