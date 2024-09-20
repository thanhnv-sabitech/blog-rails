class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  # Associations
  has_many :posts

  # Validates
  validates :name, presence: { message: "kh\u00F4ng \u0111\u01B0\u1EE3c \u0111\u1EC3 tr\u1ED1ng" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "kh\u00F4ng h\u1EE3p l\u1EC7" }
end
