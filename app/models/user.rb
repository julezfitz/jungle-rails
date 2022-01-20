class User < ActiveRecord::Base

    has_secure_password

    validates :password, length: {minimum: 5}
    validates :password_confirmation, presence: true

    validates :email, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, :uniqueness => {:case_sensitive => false}

    def self.authenticate_with_credentials(email, password)        
        User.where('lower(email) = ?', email.downcase.strip).first&.authenticate(password) or nil
    end

end
