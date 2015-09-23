class User < ActiveRecord::Base
  belongs_to :departament
  before_create :downcase_stuff
  
  #has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>", :small => "48x48" }, :default_url => "/images/:style/missing.png"
  
  
  validates :name, {presence: true}
  validates :office, {presence: true}
  
  has_attached_file :cover,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :styles => {:medium => "300x300>", :small => "48x48"},
    :dropbox_options => {}
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/  
  
  def avatar
    email_address = self.email.downcase
     
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)
     
    # compile URL which can be used in <img src="RIGHT_HERE"...
    image_src = "http://www.gravatar.com/avatar/#{hash}"
  end
  
  #the Method change to lowcase the name of user table  before save
  private
    def downcase_stuff
      self.name.downcase!
    end
  
end
