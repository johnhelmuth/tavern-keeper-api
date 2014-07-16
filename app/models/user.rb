class User < ActiveRecord::Base
  has_secure_password
  
  before_save :_downcase_email!
  
  private
  def _downcase_email!
    self.email.downcase!
  end
end