class Property < ApplicationRecord
  has_many_attached :images, dependent: :destroy

  def images
    return unless object.images.attached?
    object.images.map do |image|
      image.blob.attributes
        .slice('filename', 'byte_size', 'id')
        .merge(url: image_url(image)
end
end
 

  def image_url(image)
    rails_blob_path(image, only_path: true)
  end
end
