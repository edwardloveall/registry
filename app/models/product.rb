class Product < ActiveRecord::Base
  validates_presence_of :name, :price

  has_attached_file :image,
    styles: { :thumb => "100x100>" },
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
