class User < ApplicationRecord
  
  has_secure_password
  has_many :teas, dependent: :destroy



  def self.create_with_omniauth(auth)
  
    user = find_or_create_by(uid: auth["uid"], provider:  auth["provider"])
    user.email = auth["info"]["email"]
    user.name = auth["info"]["name"]
    user.password = SecureRandom.hex
    user.save!
    user
  end
  

  # def self.find_or_create_by_omniauth(auth_hash)
  #   self.where(email: => auth_hash["info"]["email"]).first_or_create do |user|
  #     user.password = SecureRandom.hex
  #   end
  # end

   def self.from_omniauth(auth_hash) 
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first 
    unless user 
        user = where(email: auth_hash.info.email).first_or_initialize 
        user.email = auth.info.email
        user.name = auth_hash.info.name 
        user.image = auth_hash.info.image 
        user.password = Devise.friendly_token[0,20]
        (user.save!(validate: false))
    end
    user
end

end
