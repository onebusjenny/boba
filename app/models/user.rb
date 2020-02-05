class User < ApplicationRecord
  has_secure_password
  has_many :teas, dependent: :destroy

  def logged_in?

  end

  def self.most_teas
  joins(:teas).group("users.id").order('count(teas.id) desc').limit(1).first
  end

end
