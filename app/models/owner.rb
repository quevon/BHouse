class Owner < ApplicationRecord
  include OwnerProfileImage::Attachment(:image)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  # has_one_attached :profile_picture

  # after_commit :add_default_profile_picture, on: [:create, :update]



  validates_presence_of :email, :firstname, :middlename, :lastname
  after_create :send_admin_mail

  def send_admin_mail
    AdminMailer.new_user_waiting_for_approval(email).deliver
  end

  def active_for_authentication? 
    super && approved?
  end 
          
  def inactive_message 
    approved? ? super : :not_approved
  end


  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if recoverable.persisted?
      if recoverable.approved?
        recoverable.send_reset_password_instructions
      else
        recoverable.errors.add(:base, :not_approved)
      end
    end
    recoverable
  end

  private 

  # def add_default_profile_picture
  #   unless profile_picture.attached?
  #     self.profile_picture.attach(io: File.open(Rails.root.join("app", "assets", "images", "empty.png")), filename: 'empty.png' , content_type: "image/png")
  #   end
  # end
end
