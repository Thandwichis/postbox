class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :sent_letters, class_name: 'Letter', foreign_key: 'sender_id'
         has_many :received_letters, class_name: 'Letter', foreign_key: 'receiver_id'
end
