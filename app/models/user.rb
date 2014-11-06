class User < ActiveRecord::Base
    validates :name, presence: true
    validates :email, presence: true
    validates :role, presence: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true, length: { minimum: 6 }
    # validates :email, format: { with: /\A\S+@\S+\.\S+\z/, message: 'must be a valid email address'}
end
