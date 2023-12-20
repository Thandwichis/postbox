class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :username, presence: true, uniqueness: true     
         validates :time_zone, presence: true

         has_many :sent_letters, class_name: 'Letter', foreign_key: 'sender_id'
         has_many :received_letters, class_name: 'Letter', foreign_key: 'receiver_id'
         has_many :user_stamps
         has_many :stamps, through: :user_stamps
         validate :cents_limit
         enum role: [:user, :admin]
         after_initialize :set_default_role, if: :new_record?

          private
          
          def set_default_role
            self.role ||= :user
          end
          def cents_limit
            return if admin?
            
            if cents > 15
              errors.add(:cents, "cannot be more than 15")
            end
          end
          
 end
