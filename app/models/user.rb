class User < ActiveRecord::Base
  has_secure_password
  attr_accessor :avatar

  attr_accessor :avatar_file_name

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  #validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates_attachment :avatar, :presence => true,
  :content_type => { :content_type => "image/jpg" },
  :size => { :in => 0..1000.kilobytes }

  has_many :articles, dependent: :destroy

  def avatar_content_type
  	return "image/jpg"
  end
end
