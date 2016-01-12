class User < ActiveRecord::Base
 has_secure_password
 has_attached_file :avatar, styles: { img: "64x64"}
 has_many :entries
end
