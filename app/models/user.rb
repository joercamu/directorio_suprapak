class User < ActiveRecord::Base
  belongs_to :departament
  
  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>", :small => "48x48" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
  
  validates :name, {presence: true}
end
