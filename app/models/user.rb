class User < ApplicationRecord
    has_secure_password

    validates_length_of       :password, maximum: 12, minimum: 6, allow_nil: false, allow_blank: false
    validates_confirmation_of :password, allow_nil: false, allow_blank: false

    before_validation { 
        (self.email = self.email.to_s.downcase) && (self.name = self.name.to_s.downcase) 
    }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :name, presence: true, uniqueness: true

    has_many :contents
end
