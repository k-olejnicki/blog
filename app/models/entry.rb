class Entry < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :contents, presence: true
  has_many :comments
  belongs_to :user
  has_attached_file :image, styles: { normal: "900x300" },
  :storage => :dropbox,
      :dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
      :dropbox_options => {
          :path => proc { |style| "#{style}/#{id}_#{image.original_filename}"},
          :unique_filename => true},
          :dropbox_visibility => 'public'
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
