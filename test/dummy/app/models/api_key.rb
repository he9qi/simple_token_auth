class ApiKey < ActiveRecord::Base
  belongs_to :token_authenticatable, polymorphic: true
  before_create :generate_access_token, :set_expiry_date

  scope :active, -> { where("expired_at >= ?", Time.now) }

  private

  def set_expiry_date
    self.expired_at = SimpleTokenAuth.expire_in.since
  end

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end
end
