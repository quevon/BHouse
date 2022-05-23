class Owner < ApplicationRecord
  include ImageUploader::Attachment(:image)
  has_many :properties
  has_many :transactions
  has_many :conversations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  # has_one_attached :profile_picture

  # after_commit :add_default_profile_picture, on: [:create, :update]

  acts_as_messageable

  def name
    "#{firstname} #{lastname}"
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

  # property methods
  def total_pending_tenants
    total = 0
    self.properties.each do |property|
      total += property.pending_tenants.count
    end
    return total
  end

  def total_present_tenants
    total = 0
    self.properties.each do |property|
      total += property.present_tenants.count
    end
    return total
  end

  def present_monthly_income
    total = 0 
    self.properties.each do |property|
      revenue = property.present_tenants.count * property.monthly_price
      total += revenue
    end
    return total
  end

  def projected_monthly_income
    total = 0 
    self.properties.each do |property|
      revenue = property.slots * property.monthly_price
      total += revenue
    end
    return total
  end

  def total_slots_available
    self.properties.sum(:slots)
  end

  # transaction methods
  def waiting_for_payment
    total = 0
    self.transactions.where(:status => "Waiting for Payment").each do |transaction|
      total += transaction.amount
    end
    return total
  end



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
