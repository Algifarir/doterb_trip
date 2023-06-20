class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_create :assign_default_role
  has_many :attendances
  has_many :invitations
  # after_create :send_new_user_notification
  
  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end
  private

  def send_new_user_notification
    UserMailer.new_user_notification(self).deliver_now
  end
  
end
