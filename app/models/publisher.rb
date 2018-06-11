class Publisher < ApplicationRecord
  has_many :books
  has_attached_file :publisher_avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: 'publisher.jpg'
  validates_attachment_content_type :publisher_avatar, content_type: /\Aimage\/.*\z/
end
