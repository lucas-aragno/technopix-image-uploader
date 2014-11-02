class Image < ActiveRecord::Base
  has_attached_file :photo
  validates_attachment_content_type :photo, :content_type => /\Aimage/
  validates_attachment_file_name :photo, :matches => [/png\Z/, /jpe?g\Z/]
end
