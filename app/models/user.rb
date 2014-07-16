class User < ActiveRecord::Base
  has_secure_password
  
  has_many :characters
  has_many :campaign_users, class: Campaign::User
  has_many :campaigns, through: :campaign_users
  
  before_save :_downcase_email!
  
  private
  def _downcase_email!
    self.email.downcase!
  end
end