class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true,
    if: Proc.new { |a| a.password_digest.nil? }
  validates :password, confirmation: true,
    if: Proc.new { |a| a.password_digest.nil? }
  validates :email, format: /@/
  has_many :created_challenges, :class_name => 'Challenge', :foreign_key => 'creator_id'
  has_many :received_challenges, :class_name => 'Challenge', :foreign_key => 'challenger_id'
  has_many :accepted_challenges
  has_many :comments

  def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.gender = auth.extra.raw_info.gender
      user.email = auth.info.email
      user.img_url = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password = SecureRandom.urlsafe_base64
      user.save!
    end
  end

end
