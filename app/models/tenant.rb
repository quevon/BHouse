class Tenant < ApplicationRecord
  include ImageUploader::Attachment(:image)
  has_many :property_tenants
  has_many :likes
  has_many :liked_properties, through: :likes, source: :property
  has_many :applied_properties, through: :property_tenants, source: :property
  has_many :transactions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  acts_as_messageable
  validates_presence_of :email, :firstname, :middlename, :lastname
  validates :balance, :numericality => { :greater_than_or_equal_to => 0 }

  def name
    "#{firstname.titleize} #{lastname.titleize}"
  end
       
  def mailboxer_email(object)
    nil 
  end

  def notifs
    if self.mailbox 
      if self.mailbox.receipts 
        self.mailbox.receipts.where(:is_read => false).count 
      end
    end
  end
  
  def my_property
    self.property_tenants.where(:status => "approved")[0].property
  end

  def my_pending_transactions
    total = 0
    self.transactions.where(:status => "Waiting for Payment").each do |transaction|
      total += transaction.amount
    end
    return total
  end

  # has_one_attached :profile_picture

  # after_commit :add_default_profile_picture, on: [:create, :update]

  # private 

  # def add_default_profile_picture
  #   unless profile_picture.attached?
  #     self.profile_picture.attach(io: File.open(Rails.root.join("app", "assets", "images", "empty.png")), filename: 'empty.png' , content_type: "image/png")
  #   end
  # end

end
