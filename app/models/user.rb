class User < ActiveRecord::Base
  belongs_to :departament
  before_create :downcase_stuff
  
  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>", :small => "48x48" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
  
  validates :name, {presence: true}
  validates :office, {presence: true}
  
  
  #the Method change to lowcase the name of user table  before save
  private
    def downcase_stuff
      self.name.downcase!
    end
  
end
