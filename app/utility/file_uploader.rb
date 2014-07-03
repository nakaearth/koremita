class FileUploader
  def self.upload_cloudinary(file, type, public_id)

    p ENV['CLOUDINARY_KEY']
    options = { tags: [Rails.env, type], public_id: public_id,
                image_metadata: false, flags: :force_strip }
    uploaded_photo = Cloudinary::Uploader.upload(file, options)
    uploaded_photo['secure_url']
  end
end
