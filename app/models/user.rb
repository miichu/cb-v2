class User < ApplicationRecord
    #before saving, make sure the email is in downcase
    before_save { self.email = email.downcase }
    
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
                    
                    
    # Let's you safely store a hashed password_digest to DB,
    # gives you password & password_confirmation attributes, 
    # an authenticate method that returns the user when pw is correct,
    # otherwise false. 
    has_secure_password(validations:false)
    validates :password, presence:true, length: { minimum: 6 }
    
     # Returns the hash digest of the given string.
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
