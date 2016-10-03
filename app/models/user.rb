class User < ActiveRecord::Base
 has_secure_password
 has_many :entries
 has_many :comments
 has_attached_file :avatar, styles: { img: "64x64"},
     :storage => :dropbox,
     :dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
     :dropbox_options => {
     :path => proc { |style| "#{style}/#{id}_#{avatar.original_filename}"},
     :unique_filename => true},
     :dropbox_visibility => 'public'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
