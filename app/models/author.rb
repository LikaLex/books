class Author < ApplicationRecord
  has_many :books

  has_attached_file :author_avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: 'author.jpg'
  validates_attachment_content_type :author_avatar, content_type: /\Aimage\/.*\z/
end
