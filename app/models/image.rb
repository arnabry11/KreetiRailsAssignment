class Image < ApplicationRecord
  has_attached_file :assignment_image, styles: { large: "600x600", medium: "300x300>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :assignment_image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :assignment_image, presence: true
end
