# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process convert: 'png'

  version :standard do
    process resize_to_fill: [100, 150, :north]
  end

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  def public_id
    model.id
  end
end
