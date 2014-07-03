# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  storage :file

  def store_dir
    "uploads/koremita/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process convert: 'png'

  version :standard do
    process eager: true
    process resize_to_fill: [100, 150, :north]
  end

  version :thumbnail do
    eager
    process resize_to_fit: [50, 50]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

  def public_id
    model.id
  end
end
