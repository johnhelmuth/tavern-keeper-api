class ApiKey < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization
  
  validates :user_id, presence: true
  validates :secret, presence: true
  
  before_validation :_generate_secret
  
  enum status: [:user, :application, :revoked]
  
  private
  def _generate_secret
    self.secret = SecureRandom.uuid if self.secret.nil?
  end
end