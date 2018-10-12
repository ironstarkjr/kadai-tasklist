class User < ApplicationRecord
  bafore_save { self.email.downcase! }
  
  validates :name, presence: true, length: { maximu: 50 }
  validates :email, presence: true, length: { maximu: 255 }, 
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, 
                    uniqueness: { case_sensitive: false }
  
  has_secure_password
end
