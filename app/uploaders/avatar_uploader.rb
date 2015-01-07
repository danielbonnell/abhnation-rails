class AvatarUploader < CarrierWave::Uploader::Base
  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
