class User < ActiveRecord::Base
 has_secure_password
 has_attached_file :avatar, styles: { img: "64x64"}
 validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
 has_many :entries
 has_many :comments
end
