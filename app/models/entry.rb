class Entry < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :contents, presence: true
  has_many :comments
  belongs_to :user
  has_attached_file :image, styles: { normal: "900x300" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
