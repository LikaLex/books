class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :books
  has_many :reviews

  has_attached_file :avatar, :styles =>  {:medium => "250x350>",
                                          :original => "325x475>" , :thumb=> "100x200>"  },
                    default_url: 'person.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


end
