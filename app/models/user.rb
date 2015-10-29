class User < ActiveRecord::Base
    has_secure_password
    has_many :posts, dependent: :destroy
    validates :email, presence: true , uniqueness: true, length: {minimum: 2}

  
end