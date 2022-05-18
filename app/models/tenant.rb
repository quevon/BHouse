class Tenant < ApplicationRecord
  include ImageUploader::Attachment(:image)
  has_many :property_tenants
  has_many :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  acts_as_messageable

  def name
    "#{firstname} #{lastname}"
  end
       
  def mailboxer_email(object)
    nil 
  end
  
  validates_presence_of :email, :firstname, :middlename, :lastname



  # has_one_attached :profile_picture

  # after_commit :add_default_profile_picture, on: [:create, :update]

  # private 

  # def add_default_profile_picture
  #   unless profile_picture.attached?
  #     self.profile_picture.attach(io: File.open(Rails.root.join("app", "assets", "images", "empty.png")), filename: 'empty.png' , content_type: "image/png")
  #   end
  # end

end
