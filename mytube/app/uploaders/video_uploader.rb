# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base

  # Storage configuration within the uploader supercedes the global CarrierWave
  # config, so be sure that your uploader does not contain `storage :file`, or
  # AWS will not be used.
  storage :aws

  # You can find full list of custom headers in AWS SDK documentation on
  # AWS::S3::S3Object
  def download_url(filename)
    url(response_content_disposition: %Q{attachment; filename="#{filename}"})
  end
end
